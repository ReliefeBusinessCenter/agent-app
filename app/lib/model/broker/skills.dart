class Skills {
  int? skillsId;
  int? communicationSkill;
  int? brokingSkill;
  int? workDone;
  int? workInProgress;

  Skills(
      {this.skillsId,
      this.communicationSkill,
      this.brokingSkill,
      this.workDone,
      this.workInProgress});

  Skills.fromJson(Map<String, dynamic> json) {
    skillsId = json['skillsId'];
    communicationSkill = json['communicationSkill'];
    brokingSkill = json['brokingSkill'];
    workDone = json['workDone'];
    workInProgress = json['workInProgress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skillsId'] = this.skillsId;
    data['communicationSkill'] = this.communicationSkill;
    data['brokingSkill'] = this.brokingSkill;
    data['workDone'] = this.workDone;
    data['workInProgress'] = this.workInProgress;
    return data;
  }
}