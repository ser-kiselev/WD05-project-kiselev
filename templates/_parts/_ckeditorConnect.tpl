<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function(){ // Аналог $(document).ready(function(){
		CKEDITOR.replace('ckEditor', {
			customConfig: '<?=HOST?>templates/assets/js/ckeditorConfig.js'
		});
	});
</script>