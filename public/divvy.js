// This library requires jQuery

function Divvy() {
    this.feed_url = "http://website.dev/bikes"
    this.get_stations = function(successCallback) {
        $.getJSON(this.feed_url, function(data) {
          successCallback(data);
        })
    }
}
