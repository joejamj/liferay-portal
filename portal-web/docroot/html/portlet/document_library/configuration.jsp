<%
/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/html/portlet/document_library/init.jsp" %>

<%
String strutsAction = "/document_library_display";

if (portletResource.equals(PortletKeys.DOCUMENT_LIBRARY)) {
	strutsAction = "/document_library";
}

String redirect = ParamUtil.getString(request, "redirect");
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationURL" />

<aui:form action="<%= configurationURL %>" method="post" name="fm" onSubmit='<%= renderResponse.getNamespace() + "saveConfiguration(); return false;" %>'>
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= redirect %>" />
	<aui:input name="rootFolderId" type="hidden" value="<%= rootFolderId %>" />
	<aui:input name="folderColumns" type="hidden" />
	<aui:input name="fileEntryColumns" type="hidden" />

	<liferay-ui:error key="rootFolderId" message="please-enter-a-valid-root-folder" />

	<liferay-ui:panel-container extended="<%= true %>" id="configurationPanel" persistState="<%= true %>">
		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="folders" persistState="<%= true %>" title='<%= LanguageUtil.get(pageContext, "folders-listing") %>'>
			<aui:fieldset>
				<aui:field-wrapper label="root-folder">
					<portlet:renderURL var="viewFolderURL" windowState="<%= WindowState.MAXIMIZED.toString() %>">
						<portlet:param name="struts_action" value='<%= strutsAction + "/view" %>' />
						<portlet:param name="folderId" value="<%= String.valueOf(rootFolderId) %>" />
					</portlet:renderURL>

					<aui:a href="<%= viewFolderURL %>" id="rootFolderName"><%= rootFolderName %></aui:a>

					<aui:button name="openFolderSelectorButton" onClick='<%= renderResponse.getNamespace() + "openFolderSelector();" %>' type="button" value="select" />

					<aui:button disabled="<%= rootFolderId <= 0 %>" name="removeFolderButton" onClick='<%= renderResponse.getNamespace() + "removeFolder();" %>' value="remove" />
				</aui:field-wrapper>

				<aui:input inlineLabel="left" name="showBreadcrumbs" type="checkbox" value="<%= showBreadcrumbs %>" />

				<aui:input inlineLabel="left" label="show-search" name="showFoldersSearch" type="checkbox" value="<%= showFoldersSearch %>" />

				<aui:input inlineLabel="left" name="showSubfolders" type="checkbox" value="<%= showSubfolders %>" />

				<aui:input name="foldersPerPage" size="2" type="text" value="<%= foldersPerPage %>" />

				<aui:field-wrapper label="show-columns">

					<%
					Set availableFolderColumns = SetUtil.fromArray(StringUtil.split(allFolderColumns));

					// Left list

					List leftList = new ArrayList();

					for (int i = 0; i < folderColumns.length; i++) {
						String folderColumn = folderColumns[i];

						leftList.add(new KeyValuePair(folderColumn, LanguageUtil.get(pageContext, folderColumn)));
					}

					// Right list

					List rightList = new ArrayList();

					Arrays.sort(folderColumns);

					Iterator itr = availableFolderColumns.iterator();

					while (itr.hasNext()) {
						String folderColumn = (String)itr.next();

						if (Arrays.binarySearch(folderColumns, folderColumn) < 0) {
							rightList.add(new KeyValuePair(folderColumn, LanguageUtil.get(pageContext, folderColumn)));
						}
					}

					rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
					%>

					<liferay-ui:input-move-boxes
						formName="fm"
						leftTitle="current"
						rightTitle="available"
						leftBoxName="currentFolderColumns"
						rightBoxName="availableFolderColumns"
						leftReorder="true"
						leftList="<%= leftList %>"
						rightList="<%= rightList %>"
					/>
				</aui:field-wrapper>
			</aui:fieldset>
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="documents" persistState="<%= true %>" title='<%= LanguageUtil.get(pageContext, "documents-listing") %>'>
			<aui:fieldset>
				<aui:input inlineLabel="left" label="show-search" name="showFileEntriesSearch" type="checkbox" value="<%= showFileEntriesSearch %>" />

				<aui:input label="documents-per-page" name="fileEntriesPerPage" size="2" type="text" value="<%= fileEntriesPerPage %>" />

				<aui:field-wrapper label="show-columns">

					<%
					Set availableFileEntryColumns = SetUtil.fromArray(StringUtil.split(allFileEntryColumns));

					// Left list

					List leftList = new ArrayList();

					for (int i = 0; i < fileEntryColumns.length; i++) {
						String fileEntryColumn = fileEntryColumns[i];

						leftList.add(new KeyValuePair(fileEntryColumn, LanguageUtil.get(pageContext, fileEntryColumn)));
					}

					// Right list

					List rightList = new ArrayList();

					Arrays.sort(fileEntryColumns);

					Iterator itr = availableFileEntryColumns.iterator();

					while (itr.hasNext()) {
						String fileEntryColumn = (String)itr.next();

						if (Arrays.binarySearch(fileEntryColumns, fileEntryColumn) < 0) {
							rightList.add(new KeyValuePair(fileEntryColumn, LanguageUtil.get(pageContext, fileEntryColumn)));
						}
					}

					rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
					%>

					<liferay-ui:input-move-boxes
						formName="fm"
						leftTitle="current"
						rightTitle="available"
						leftBoxName="currentFileEntryColumns"
						rightBoxName="availableFileEntryColumns"
						leftReorder="true"
						leftList="<%= leftList %>"
						rightList="<%= rightList %>"
					/>
				</aui:field-wrapper>
			</aui:fieldset>
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="ratings" persistState="<%= true %>" title='<%= LanguageUtil.get(pageContext, "ratings") %>'>
			<aui:input inlineLabel="left" name="enableCommentRatings" type="checkbox" value="<%= enableCommentRatings %>" />
		</liferay-ui:panel>
	</liferay-ui:panel-container>

	<aui:button-row>
		<aui:button type="submit" />

		<aui:button onClick="<%= redirect %>" type="cancel" />
	</aui:button-row>
</aui:form>

<aui:script>
	function <portlet:namespace />openFolderSelector() {
		var folderWindow = window.open('<liferay-portlet:renderURL windowState="<%= LiferayWindowState.POP_UP.toString() %>" portletName="<%= portletResource %>"><portlet:param name="struts_action" value='<%= strutsAction + "/select_folder" %>' /></liferay-portlet:renderURL>', 'folder', 'directories=no,height=640,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no,width=830');

		folderWindow.focus();
	}

	function <portlet:namespace />removeFolder() {
		document.<portlet:namespace />fm.<portlet:namespace />rootFolderId.value = "<%= DLFolderConstants.DEFAULT_PARENT_FOLDER_ID %>";

		var nameEl = document.getElementById("<portlet:namespace />rootFolderName");

		nameEl.href = "";
		nameEl.innerHTML = "";
	}

	function <portlet:namespace />saveConfiguration() {
		document.<portlet:namespace />fm.<portlet:namespace />folderColumns.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />currentFolderColumns);
		document.<portlet:namespace />fm.<portlet:namespace />fileEntryColumns.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />currentFileEntryColumns);

		submitForm(document.<portlet:namespace />fm);
	}

	function <%= PortalUtil.getPortletNamespace(portletResource) %>selectFolder(rootFolderId, rootFolderName) {
		document.<portlet:namespace />fm.<portlet:namespace />rootFolderId.value = rootFolderId;

		var nameEl = document.getElementById("<portlet:namespace />rootFolderName");

		nameEl.href = "<liferay-portlet:renderURL windowState="<%= WindowState.MAXIMIZED.toString() %>" portletName="<%= portletResource %>"><portlet:param name="struts_action" value='<%= strutsAction + "/view" %>' /></liferay-portlet:renderURL>&<portlet:namespace />folderId=" + rootFolderId;
		nameEl.innerHTML = rootFolderName + "&nbsp;";
	}
</aui:script>