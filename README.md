<h2>Requirements</h2>
- JDK 7+
- JSAGA libs (v1.1.x)
- jsaga-job-management (v1.5.9+)
- MOLON-browse-portlet-6.1.1.1.war

<h2>About the MOLON application</h2>
<p align="justify">
Molon portet (MOLar absortiON coefficient) calculates the molar absorption coefficient for a number of molecules. To do so, it gathers information from the MPI-Mainz database, available at http://satellite.mpic.de/spectral_atlas .

The numerical data is available in ASCII format and contains two columns: the first column gives the wavelength ? (in nm) (generally in air unless vacuum wavelengths are indicated); the second column contains the absorption cross section ? (in cm2 molecule-1) or quantum yield (dimensionless).

This information is downloaded and processed by Molon to in order to calculate the molar absortion coeffient, which is then presented to the user in a single text file. Molon makes usage of PID service to store the URL corresponding to the database location. This way, the user only needs to include the molecule he wants to process, and the system will automatically convert that information into the corresponding text file, which is then downloaded by the portlet.
<br/><br/>
</p>

<h2>Contribute</h2>
- Fork it
- Create a branch (git checkout -b my_markup)
- Commit your changes (git commit -am "My changes")
- Push to the branch (git push origin my_markup)
- Create an Issue with a link to your branch
 
<h2>Sponsors</h2>
<table border="0">
<tr>
<td>
<a href="http://www.infn.it/"><img width="150" src="http://www.infn.it/logo/weblogo1.gif" border="0" title="The INFN Home Page"></a>
</td>
<td></td>
<td>
<a href="http://rdgroups.ciemat.es/web/sci-track"><img width="150" src="http://rdgroups.ciemat.es/image/layout_set_logo?img_id=367115&t=1433243514422" border="0" title="Sci-Track Home Page"></a>
</td>
<td></td>
<td>
<a href="http://www.chain-project.eu/"><img width="150" src="https://www.chain-project.eu/image/image_gallery?uuid=4b273102-2ed0-49ca-929f-c23379318171&groupId=3456180&t=1424446552904" border="0" title="The CHAIN-REDS Home Page"></a>
</td>
</tr>
</table>

