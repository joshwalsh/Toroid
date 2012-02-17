describe("Planet Map", function() {
  beforeEach(function() {
    PlanetMap.pixelDimension = 20;
    PlanetMap.gap = 5;
  });

  it("Gets plot point for coordinate 0", function() {
    expect(PlanetMap._plotPoint(0)).toEqual(0);
  });

  it("Gets plot point for coordinate 1", function() {
    expect(PlanetMap._plotPoint(1)).toEqual(25);
  });

  it("Gets plot point for coordinate 2", function() {
    expect(PlanetMap._plotPoint(2)).toEqual(50);
  });
});
