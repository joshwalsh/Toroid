var PlanetMap = {
  pixelDimension: 40,
  gap: 10, 

  initialize: function($canvas, width, height) {
    this.$canvas = $canvas;
    this.context = this.$canvas[0].getContext('2d');

    this.width = width;
    this.height = height;

    this.$canvas.attr('width', this.width * this._pixelsPerPoint());
    this.$canvas.attr('height', this.height * this._pixelsPerPoint());
  },

  renderMap : function() {
    this.context.beginPath();

    for (x = 0; x < this.width; x++) {
      for (y = 0; y < this.height; y++) {
        this._renderPoint(x, y);
      }
    }

    this.context.fillStyle = "#eeeeee";
    this.context.fill();

    this.context.closePath();
  },

  renderOccupiedPoint: function(x, y) {
    this.context.beginPath();

    this._renderPoint(x, y);

    this.context.fillStyle = "#888888";
    this.context.fill();

    this.context.closePath();
  },

  _renderPoint: function(x, y) {
    var pixelX = this._plotPoint(x);
    var pixelY = this._plotPoint(y);

    this.context.rect(pixelX, pixelY, this.pixelDimension, this.pixelDimension);
  },

  _plotPoint: function(coordinate) {
    return coordinate * this._pixelsPerPoint();
  },

  _pixelsPerPoint: function() {
    return this.pixelDimension + this.gap;
  }
}
