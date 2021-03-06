@echo off
setlocal

echo This test batch file shows several typical ways
echo to use XmlValidate with the sample XML data
echo located in data directory, schemas in schemas/,
echo and wrapper .bat files in /bin.
echo.
echo ==========================================
echo.

REM Source XML files are loaded into memory so may need
REM to increase memory limits to validate very large XML.
set OPTS=-Xmx64m

echo Validate CoT XML document with non-namespace schema
call bin\xv.bat -schema=schemas\Event.xsd -v data/xml/cot.xml
echo.
echo ==========================================

echo.
echo Validate all KML/KMZ documents as KML 2.1 Schema
call bin\kml21.bat -kmz data\kml\tessellate-orig.kml data/kmz
echo.
echo ==========================================

echo.
echo Validate all GPX/KML/KMZ documents
call bin\xv.bat -v -kmz -x=gpx data/xml data/kml data/kmz
echo.
echo Notice the tessellate-orig.kml example has the wrong namespace
echo and fails to validate against the specified schema namespace.
echo ==========================================
