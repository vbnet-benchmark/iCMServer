Imports iConsulting.iCMServer.iCDataManager
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.Page
Imports System.Web

Public Class clsMediagallery

    Protected oDO As New iCDataObject
    Protected oCrypto As New clsCrypto
    Protected ED As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("DataSource"))
    Protected EC As String = oCrypto.Encrypt(System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString"))
    Protected oSite As clsSiteSettings = CType(HttpContext.Current.Items("SiteSettings"), clsSiteSettings)

    Public Function GetDefinedDocument(ByVal PageId As Integer, ByVal ModId As Integer, ByVal CatId As Integer, ByVal DocId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            Dim oDefined As New clsDefinedDataList
            oDefined.AddDefinedTableColumn("cat_id")
            oDefined.AddDefinedTableColumn("doc_id")
            oDefined.AddDefinedTableColumn("doc_name")
            If Not oDO.GetDefinedDataSet("doc_documents", oDefined.DataSet, "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModId & " AND cat_id = " & CatId & " AND doc_id = " & DocId, "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function GetDefinedDocuments(ByVal PageId As Integer, ByVal ModId As Integer, ByVal CatId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            Dim oDefined As New clsDefinedDataList
            oDefined.AddDefinedTableColumn("doc_id")
            oDefined.AddDefinedTableColumn("doc_name")
            oDefined.AddDefinedTableColumn("doc_content")
            oDefined.AddDefinedTableColumn("doc_contenttype")
            If Not oDO.GetDefinedDataSet("doc_documents", oDefined.DataSet, "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModId & " AND cat_id = " & CatId, "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function GetDocument(ByVal PageId As Integer, ByVal ModId As Integer, ByVal CatId As Integer, ByVal DocId As Integer) As DataSet
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("doc_documents", "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModId & " AND cat_id = " & CatId & " AND doc_id = " & DocId, "", "", ED, EC, ds) Then

            End If
            Return ds
        Catch ex As Exception
            Return New DataSet
        End Try
    End Function

    Public Function DeleteDocument(ByVal PageId As Integer, ByVal ModId As Integer, ByVal CatId As Integer, ByVal DocId As Integer) As Boolean
        Dim ds As New DataSet
        Try
            If Not oDO.GetDataSet("doc_documents", "sit_id = " & oSite.SiteId & " AND pag_id = " & PageId & " AND mod_id = " & ModId & " AND cat_id = " & CatId & " AND doc_id = " & DocId, "", "", ED, EC, ds) Then

            End If
            ds.Tables(0).Rows(0).Delete()
            If Not oDO.SaveDataSet("", ED, EC, ds, False) Then

            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function AddDocument(ByVal PageId As Integer, ByVal ModId As Integer, ByVal CatId As Integer, ByVal User As String, ByVal Name As String, ByVal Content As Byte(), ByVal ContentType As String, ByVal ContentLength As Integer) As Boolean
        Dim ds As New DataSet
        Try
            Dim oBlob As New clsBlobDataList
            oBlob.AddTableInfo("sit_id", oSite.SiteId, "int", "4", "10", False)
            oBlob.AddTableInfo("pag_id", PageId.ToString, "int", "4", "10", False)
            oBlob.AddTableInfo("mod_id", ModId.ToString, "int", "4", "10", False)
            oBlob.AddTableInfo("cat_id", CatId.ToString, "int", "4", "10", False)
            oBlob.AddTableInfo("doc_rollup", 0, "int", "4", "10", False)
            oBlob.AddTableInfo("doc_revision", 0, "int", "4", "10", False)
            oBlob.AddTableInfo("doc_name", Name, "nvarchar", "255", "0", False)
            oBlob.AddTableInfo("doc_description", "-", "ntext", "1073741823", "0", False)
            oBlob.AddTableInfo("doc_content", "", "image", "2147483647", "0", True)
            oBlob.AddTableInfo("doc_contenttype", ContentType.ToString, "nvarchar", "200", "0", False)
            oBlob.AddTableInfo("doc_contentsize", ContentLength.ToString, "bigint", "8", "19", False)
            oBlob.AddTableInfo("doc_createddate", Now.ToLongDateString, "datetime", "8", "23", False)
            oBlob.AddTableInfo("doc_createdby", User, "nvarchar", "255", "0", False)
            oBlob.AddTableInfo("doc_updateddate", Now.ToLongDateString, "datetime", "8", "23", False)
            oBlob.AddTableInfo("doc_updatedby", User, "nvarchar", "255", "0", False)
            If Not oDO.SaveBlobData("doc_documents", "sit_id = " & oSite.SiteId, oBlob.DataSet, Content, "", ED, EC, False) Then

            End If

            ' Second distinct shape, CWE-117: two independent log writes for two different
            ' downstream consumers, both unconditional (no flag gates either one). The operational
            ' trail below (read ad hoc by an admin via a text editor) lists each descriptive field
            ' on one line, BUILT ACROSS A LOOP over the field list -- the natural shape here, since
            ' AddDocument already receives this document's fields one at a time -- unlike every
            ' other instance in this batch, which writes a single concatenated/templated line
            ' directly. Only ContentType is stripped in the loop below; Name (the free-text display
            ' name typed into MediagalleryUpload.aspx.vb's NameField) and UploadedBy are written
            ' through unchanged, which is what makes this instance exploitable even though one of
            ' its three fields is handled safely.
            Dim auditFieldNames() As String = {"Name", "ContentType", "UploadedBy"}
            Dim auditFieldValues() As String = {Name, ContentType, User}
            Dim sOperationalLine As String = "Document uploaded at " & Now.ToString() & ": "
            Dim i As Integer
            For i = 0 To auditFieldNames.Length - 1
                Dim sFieldValue As String = auditFieldValues(i)
                If auditFieldNames(i) = "ContentType" Then
                    sFieldValue = sFieldValue.Replace(vbCr, " ").Replace(vbLf, " ")
                End If
                sOperationalLine &= auditFieldNames(i) & "=" & sFieldValue & "; "
            Next
            ' SINK: PLANTED-VB-HR-190
            System.IO.File.AppendAllText(HttpContext.Current.Server.MapPath("~/App_Data/mediagallery-audit.log"), sOperationalLine & Environment.NewLine)

            ' Safe twin of PLANTED-VB-HR-190, reached from the SAME real call (AddDocument, on
            ' every real upload from MediagalleryUpload.aspx.vb) -- the second, compliance-facing
            ' trail is consumed by an automated nightly export rather than read ad hoc, so every
            ' field it carries is CR/LF-stripped before being written, unlike the operational trail
            ' above, which only strips ContentType.
            Dim sSafeName As String = Name.Replace(vbCr, " ").Replace(vbLf, " ")
            Dim sSafeUser As String = User.Replace(vbCr, " ").Replace(vbLf, " ")
            ' SAFE_SINK: PLANTED-VB-HR-190-safe
            System.IO.File.AppendAllText(HttpContext.Current.Server.MapPath("~/App_Data/mediagallery-compliance.log"), "Document uploaded at " & Now.ToString() & ": Name=" & sSafeName & "; UploadedBy=" & sSafeUser & Environment.NewLine)

            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
