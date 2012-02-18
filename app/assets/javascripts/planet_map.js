var PlanetMap = {
  pixelDimension: 40,
  gap: 10, 

  setup: function(canvas_id, width, height) {
    this.paper = new Raphael(canvas_id, width * this._pixelsPerPoint(), height * this._pixelsPerPoint());

    this.width = width;
    this.height = height;
  },

  renderMap: function(organisms) {
    this._renderBlankMap();

    var map = this;
    $(organisms).each(function(index, organism) {
      map._renderOccupiedCell(organism);
    });
  },

  _renderBlankMap : function() {
    for (x = 0; x < this.width; x++) {
      for (y = 0; y < this.height; y++) {
        this._renderBlankCell(x, y);
      }
    }
  },

  _renderBlankCell: function(x, y) {
    this._renderCell(x, y, {fill: '#eee', 'stroke-width': 0});
  },

  _renderOccupiedCell: function(organism) {
    this._renderCell(organism.x, organism.y, {fill: '#888', 'stroke-width': 0});
  },

  _renderCell: function(x, y, style) {
    var pixelX = this._plotPoint(x);
    var pixelY = this._plotPoint(y);

    var box = this.paper.rect(pixelX, pixelY, this.pixelDimension, this.pixelDimension);
    box.attr(style);
  },

  _plotPoint: function(coordinate) {
    return coordinate * this._pixelsPerPoint();
  },

  _pixelsPerPoint: function() {
    return this.pixelDimension + this.gap;
  }
}
