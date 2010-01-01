var arno = {
      src: '/wp-content/themes/parallax/flash/arno.swf'
};
 
sIFR.activate(arno);
 
sIFR.replace(arno, {
      selector: '.entry-title',
      css: [
     '.sIFR-root { font-size:30px; float:left;  padding-top:10px; font-weight:bold; text-decoration:none; color:#77868f; }',
	'a {font-weight:bold; text-decoration:none;  padding-top:10px;  color:#77868f; }',
	'a:hover { font-weight:bold; color:#d9e2e8; padding-top:10px; }'
      ]
	selector: ".quickie",
	css: [
	'sIFR-root{visibility:hidden;} ']
});


