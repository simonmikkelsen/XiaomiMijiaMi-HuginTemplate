This is a template file for Hugin to stitch images captured with Xiaomi Mijia Mi Sphere. 

Changelog: 
	
	2017.11.06 - Added template-XiaomiMijiaMi-Horizon.pto - This template has a leveled horizon and a sharp stitch line (unfortunately it's not perfect so the overall quality can be different image by image)
	2017.09.01 - Fixed and added new control points (now +255)
			   - One bright artifact in the upper part of the image should be fixed no
			   - Fixed image output resolution
			   - TIFF / JPEG templates


TO FIX:
	- There's a weird artifact point in the bottom part of the stitched photo coming out sometime. 
	  Can't seem to able to fix it.

HELP

Make sure Hugin is installed.

Put your unstched files in a folder named unstitched. On the same level, put a folder named templates
and put the .pto files of this project into them.

Then run the Python script in the pythonbatch folder.

This produces a pto file for each image.

Next go to this folder and use hugin_executor to process each file.
Doing this on an individual basis can be done using:
hugin_executor --stitching --threads=4 myfile.pto
On Linux/Unix/Mac it can be done for all the files using:
ls *.pto | xargs -L1 hugin_executor --stitching --threads=4

