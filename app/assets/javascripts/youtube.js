var videos = document.getElementsByClassName("youtube");

for (var i=0; i<videos.length; i++) {

	var youtube = videos[i];

	var img = document.createElement("img");
	img.setAttribute("src", "http://i.ytimg.com/vi/" + youtube.id + "/hqdefault.jpg");
	img.setAttribute("class", "thumb");

	var circle = document.createElement("div");
	circle.setAttribute("class", "circle");

	youtube.appendChild(img);
	youtube.appendChild(circle);

	youtube.onclick = function() {

		var iframe = document.createElement("iframe");
		iframe.setAttribute("src", "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&border=0&wmode=opaque&enablejsapi=1");

		iframe.style.width = this.style.width;
		iframe.style.height = this.style.height;

		this.parentNode.replaceChild(iframe, this);

	};
}
