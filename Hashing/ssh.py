from hashlib import sha1
from PIL import Image
import xlwt
import glob
image_list = []
book = xlwt.Workbook()
sheet1 = book.add_sheet("Sheet 1")
i = 1
for filename in glob.glob('C:\\Users\\kr2m\\Google Drive\\DSP Prj\\vc\\ssh\\db\\*.png'):
    h = sha1(open(filename, 'rb').read()).hexdigest()
    s=(''.join(format(ord(x), 'b') for x in h))
    sheet1.write(i,1,s)
    i = i+1
    print s

book.save("Crypt.xls")
