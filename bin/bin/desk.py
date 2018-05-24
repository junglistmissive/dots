from StringIO import StringIO
from BeautifulSoup import BeautifulSoup
import requests

page = 1
while True:
	page_request = requests.get('http://simpledesktops.com/browse/%s/' % page)
	if page_request.status_code != 200:
		print 'page %s does not exist' % page
		break
	html = BeautifulSoup(page_request.text)
	images = html.findAll('img')
	for image in images:
		img_src = image['src']
		if 'static.simpledesktops.com/uploads/desktops/' in img_src:
			full_size_img = img_src.replace('.295x184_q100.png', '')
			img_name = full_size_img.split('/')[-1]
			img_request = requests.get(full_size_img)
			img_buffer = StringIO(img_request.content)
			
			
			
		
			print '%s downloaded' % full_size_img
	print '\n================'
	print 'page %s finished' % page
	print '================\n'
	page += 1
