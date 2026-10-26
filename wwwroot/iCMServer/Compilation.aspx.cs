using System;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Text;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using WebApp.Web.Compilation;
using Compil = WebApp.Web.Compilation.Compilation;
using WebApp.Web.Compilation.Runtime;

namespace WebApp
{
	/// <summary>
	/// Summary description for Compilation.
	/// </summary>
	public class Compilation : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button buttonPrecompile;
		protected System.Web.UI.WebControls.TextBox tboxAssemblyName;
		protected System.Web.UI.WebControls.TextBox tboxSourceCodePath;
		protected System.Web.UI.WebControls.Literal labelErrors;
		protected System.Web.UI.WebControls.Literal labelFiles;
		protected System.Web.UI.WebControls.Label labelCompileError;
		protected System.Web.UI.WebControls.Label labelCompilerResults;
		protected System.Web.UI.WebControls.Label labelCompilerResults2;
		protected System.Web.UI.WebControls.Label labelCompilerResults3;
		protected System.Web.UI.WebControls.Button buttonCompile;
		protected System.Web.UI.WebControls.CheckBox cboxDebugInfo;
		protected System.Web.UI.WebControls.CheckBox cboxWarningsAsErrors;
		protected System.Web.UI.WebControls.TextBox tboxResources;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.buttonPrecompile.Click += new System.EventHandler(this.buttonPrecompile_Click);
			this.buttonCompile.Click += new System.EventHandler(this.buttonCompile_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void buttonPrecompile_Click(object sender, EventArgs e)
		{
			IList list = Compil.BatchPrecompile( Context, "~/", Compil.TemplateType.Control, new string[]{ MapPath( "Compilation.aspx" ) } );

			DisplayFiles( list );
		}

		private void buttonCompile_Click(object sender, EventArgs e)
		{
			string outputPath = tboxSourceCodePath.Text.Trim();

			string assemblyName = tboxAssemblyName.Text.Trim();

			if( outputPath.Length == 0 && assemblyName.Length == 0 )
			{
				labelCompileError.Text = "Please specified at least source code output path or assembly name.";
				return;
			}

			IList list = Compil.BatchGenerateCode( Context, "~/", Compil.TemplateType.Control, new string[]{ MapPath( "Compilation.aspx" ) } );

			if( !DisplayFiles( list ) )
			{
				labelCompilerResults.Text = "<div class='compilation_error'>There are parser errors so no code can be generated for some of the files.</div>";

				Compil.DeleteResources( list );

				return;
			}

			CompilerResults results;

			if( assemblyName.Length > 0 )
			{
				outputPath = outputPath.Length == 0? null : MapPath( outputPath );

				assemblyName = MapPath( assemblyName );

				CompilerParameters parameters = Compil.CreateCompilerParameters( Context, list, assemblyName, cboxWarningsAsErrors.Checked, cboxDebugInfo.Checked );

				string resourcePatterns = tboxResources.Text.Replace( " ", "" );

				if( resourcePatterns.Length > 0 )
				{
					if( parameters.Win32Resource == null )
					{
						parameters.Win32Resource = Compil.GetCompilationResourcesFilePath( Context );
					}

					string basePath = MapPath( "~/" );

					IList resourceEntries = Compil.AddFilesToResources( 
						parameters.Win32Resource, 
						basePath, 
						resourcePatterns.Split( ',' ), 
						ResourceManager.ResourceType,
						ResourceManager.BaseResourceName
						);

					if( resourceEntries.Count > 0 )
					{
						Compil.AddIndexToResources( parameters.Win32Resource, resourceEntries );
					}
				}

				results = Compil.CompileToAssembly( Context, list, parameters, outputPath );

				if( results.Errors.Count > 0 )
				{
					labelCompilerResults.Text = "<div class='compilation_error'>Compilation failed. Compilation errors:</div>";

					labelCompilerResults2.Text = GetCompilerErrors( results );

					if( outputPath != null )
					{
						labelCompilerResults3.Text = "<div class='compilation_error'>Generated source code has been saved to " + outputPath + ".</div>";
					}
				}
				else
				{
					labelCompilerResults.Text = "<div class='compilation_success'>Compilation successfull. Generated assembly has been save to " + assemblyName + ".</div>";

					if( outputPath != null )
					{
						labelCompilerResults2.Text = "<div class='compilation_success'>Generated source code has been saved to " + outputPath + ".</div>";
					}
				}
			}
			else
			{
				outputPath = MapPath( outputPath );

				Compil.GenerateSourceCode( list, outputPath );

				labelCompilerResults.Text = "<div class='compilation_success'>Generated source code has been saved to " + outputPath + ".</div>";
			}

			Compil.DeleteResources( list );
		}

		private bool DisplayFiles( IList list )
		{
			StringBuilder s = new StringBuilder( list.Count * 100 );

			int errors = 0;

			foreach( PrecompilationUnit unit in list )
			{
				s.Append( "<div class='file'>" );
				s.Append( unit.VirtualPath );
				s.Append( " [" );
				s.Append( unit.PhysicalPath );
				s.Append( "]</div>" );

				if( unit.HasError )
				{
					Exception exc = unit.ParseError;

					if( exc is System.Reflection.TargetInvocationException )
					{
						exc = exc.InnerException;
					}

					HttpParseException parseException = exc as HttpParseException;

					HttpCompileException compileException = exc.InnerException as HttpCompileException;

					if( parseException != null )
					{
						s.Append( "<div class='exception_title'>Parser error at " );
						s.Append( parseException.FileName );
						s.Append( " line " );
						s.Append( parseException.Line );
						s.Append( " : " );
						s.Append( parseException.Message );
						s.Append( "</div><br>" );
					}
					else if( compileException != null )
					{
						s.Append( "<div class='exception_title'>Compilation error.</div><br><div class='exception_title'>Source:</div>" );
						s.Append( "<br><div class='code'>" );
						s.Append( Server.HtmlEncode( compileException.SourceCode ) );
						s.Append( "</div><br><div class='exception_title'>Compilation errors:</div>" );
						GetCompilerErrors( s, compileException.Results );
						s.Append( "<br>" );
					}
					else
					{
						s.Append( "<div class='exception'>" );

						int i = s.Length;

						s.Append( unit.ParseError );

						s.Replace( "\n", "<br>", i, s.Length - i );
						s.Append( "</div><br>" );
					}

					errors++;
				}
			}

			s.Append( "<br><div class='total'>Total controls: " );
			s.Append( list.Count );
			s.Append( "</div><div class='total'>" );
			s.Append( "Total parse errors: " );
			s.Append( errors );
			s.Append( "</div>" );

			labelFiles.Text = s.ToString();

			return errors == 0;
		}

		private string GetCompilerErrors( CompilerResults results )
		{
			return GetCompilerErrors( new StringBuilder( results.Errors.Count * 100 ), results ).ToString();
		}

		private StringBuilder GetCompilerErrors( StringBuilder s, CompilerResults results )
		{
			s.Append( "<div class='compiler_errors'>" );

			foreach( CompilerError error in results.Errors )
			{
				s.Append( error );
				s.Append( "<br>" );
			}

			s.Append( "</div>" );

			return s;
		}
	}
}
