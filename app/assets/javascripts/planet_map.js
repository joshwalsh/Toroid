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
    var pixelX = this._plotPoint(x);
    var pixelY = this._plotPoint(y);

    var box = this.paper.rect(pixelX, pixelY, this.pixelDimension, this.pixelDimension);
    box.attr({fill: '#eee', 'stroke-width': 0})
  },

  _renderOccupiedCell: function(organism) {
    var pixelX = this._plotPoint(organism.x);
    var pixelY = this._plotPoint(organism.y);

    var box = this.paper.rect(pixelX, pixelY, this.pixelDimension, this.pixelDimension);
    box.attr({fill: '#888', 'stroke-width': 0});

    var $node = $(box.node);
    $node.attr('data-x', organism.x);
    $node.attr('data-y', organism.y);
    $node.attr('data-name', organism.name);
  },

  _plotPoint: function(coordinate) {
    return coordinate * this._pixelsPerPoint();
  },

  _pixelsPerPoint: function() {
    return this.pixelDimension + this.gap;
  }
}
