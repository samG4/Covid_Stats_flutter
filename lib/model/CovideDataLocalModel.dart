class CovidDataLocalModel {
  String confirmedCases;
  String confirmedNewCases;

  String activeCases;
  String activeNewCases;

  String recoveredCases;
  String recoveredNewCases;

  String deceasedCases;
  String deceasedNewCases;

  CovidDataLocalModel() {}

  CovidDataLocalModel.AllCases(
      {this.activeNewCases,
      this.deceasedNewCases,
      this.deceasedCases,
      this.recoveredNewCases,
      this.recoveredCases,
      this.activeCases,
      this.confirmedCases,
      this.confirmedNewCases});
}
