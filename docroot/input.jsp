
<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
 

%>



<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />
<%//
  // Multi infrastructure portlet 
  //
%>

<%
// Below the descriptive area of the GATE web form 
%>
<table>
	<tr>
		<td valign="top"></td>
		<td>Molon Portlet. Please insert the PID with the information
		to analyze. <br> Pressing the <b>'Reset'</b> Button all input fields
			will be initialized.<br> Pressing the <b>'About'</b> Button
			information about the application will be shown.<br>
			Examples: SO3,C2F5CH2OH,C2H5CHO
		</td>
	<tr>
</table align="center">
<%
// Below the application submission web form 
//
// The <form> tag contains a portlet parameter value called 'PortletStatus' the value of this item
// will be read by the processAction portlet method which then assigns a proper view mode before
// the call to the doView method.
// PortletStatus values can range accordingly to values defined into Enum type: Actions
// The processAction method will assign a view mode accordingly to the values defined into
// the Enum type: Views. This value will be assigned calling the function: setRenderParameter
//
%>
<center>
	<form enctype="multipart/form-data"
		action="<portlet:actionURL portletMode="view"><portlet:param name="PortletStatus" value="ACTION_SUBMIT"/></portlet:actionURL>"
		method="post">
		<dl>
			<!-- This block contains: label, file input and textarea for GATE Macro file -->
			<dd>
				<p>
					<b>Input data PID (GRNET service)</b> <input type="text"
						name="jobPID" id="jobPID" />
				</p>
				<p>
					<b>Input data URL</b> <input type="text"
						name="inputURL" id="inputURL" />
				</p>					
				<p>
					<b>Application' input file</b> <input type="file"
						name="file_inputFile" id="upload_inputFileId" accept="*.*"
						onchange="uploadInputFileMolon()" />
				</p>
				
				
			</dd>
			<!-- This block contains the experiment name -->
			<dd>
				<p>
					Insert below your <b>job identifier</b>
				</p>
				<textarea id="jobIdentifierId" rows="1" cols="60%"
					name="JobIdentifier">molon</textarea>
			</dd>
			<!-- This block contains form buttons: Demo, SUBMIT and Reset values -->
			<dd>
				<td><input type="button" value="Submit" onClick="preSubmitMolon()"></td>
				<td><input type="reset" value="Reset values"
					onClick="resetFormMolon()"></td>
			</dd>
		</dl>
	</form>
	
	
	
	</table>
</center>

<%
// Below the javascript functions used by the GATE web form 
%>
<script type="text/javascript">
//
// preSubmit
//
function preSubmitMolon() {  
    var jobPID=document.getElementById('jobPID');
    var inputURL=document.getElementById('inputURL');
    
    var inputFileName=document.getElementById('upload_inputFileId');
    var jobIdentifier=document.getElementById('jobIdentifierId');
    
    var state_inputFileName=false;
    var state_jobIdentifier=false;
    var state_jobPID=false;
    var state_inputURL=false;
    
    if(jobPID.value=="") state_jobPID=true;
    if(inputURL.value=="") state_inputURL=true;
    if(inputFileName.value=="") state_inputFileName=true;
    if(jobIdentifier.value=="") state_jobIdentifier=true;    
       
    var missingFields="";
    if ((state_jobPID) && (state_inputURL) &&(state_inputFileName)) {
    	
    	if(state_jobPID) missingFields+="  Job PID\n";
    	if(state_inputURL) missingFields+=" input URL\n";
    	if(state_inputFileName) missingFields+="  Input file\n";

    }
    if(state_jobIdentifier) missingFields+="  Job identifier\n";
    if(missingFields == "") {
      document.forms[0].submit();
    }
    else {
      alert("You cannot send an inconsistent job submission!\nMissing fields:\n"+missingFields);
        
    }
}
//
//  uploadMacroFile
//
// This function is responsible to disable the related textarea and 
// inform the user that the selected input file will be used
function uploadInputFileMolon() {disabled = true;
	document.getElementById('jobPID').disabled = true;
	document.getElementById('inputURL').disabled = true;
	

}

//
//  resetForm
//
// This function is responsible to enable all textareas
// when the user press the 'reset' form button
function resetFormMolon() {
	var currentTime = new Date();
	var jobPID=document.getElementById('jobPID').disabled = false;
	var inputURL=document.getElementById('inputURL').disabled = false;
	
	var inputFileName=document.getElementById('upload_inputFileId');
	var jobIdentifier=document.getElementById('jobIdentifierId');
        
        // Enable the textareas
	inputFileName.disabled=false;        			
            
	// Reset the job identifier
        jobIdentifier.value="Job execution of: "+currentTime.getDate()+"/"+currentTime.getMonth()+"/"+currentTime.getFullYear()+" - "+currentTime.getHours()+":"+currentTime.getMinutes()+":"+currentTime.getSeconds();
}

</script>