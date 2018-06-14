# Docker FTP grunt

Will get files over FTP for you. 

Interesting if your device is on WLAN but there's a docker enabled box with faster ethernet connection sitting around.

## Suggested workflow

1. Use filezilla and the "copy URL" feature to generate a newline separated list of interesting stuff.
   For now, only directories are supported.
2. Use *utils/absolutepathfromurl* to convert the list in a grunt readable format.
3. Let ftp-grunt do it's thing:
   ```
   docker run ftp-grunt \
     -v /my-path-list:/opt/grunt/paths_list \
     -v /download-folder:/opt/grunt/downloads \
     -e HOST=host \
     -e USER=user \
     -e PASSWORD=password \
   ```
