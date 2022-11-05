class Doctor {

  String name;
  String phno;
  String Specialisation;
  //Doctor.constructor1(this.name, this.phno, this.Specialisation, this.prfl);
  Doctor.constructor2(this.name, this.phno, this.Specialisation);
}
List<Doctor> searchTerms = [
  Doctor.constructor2("Dr Shalini veda", "234567", "psychiatrist"),
  Doctor.constructor2("Dr Vedik gosh", "2345622", "General practitioner"),
  Doctor.constructor2("Dr Amedi shah", "98765434567", "Orthopedics"),
  Doctor.constructor2("Dr Noor Ahmed", "98765434567", "Neurologist"),
  Doctor.constructor2("Dr Rahul Dariya", "8765433456", "Dermatologist"),
  Doctor.constructor2("Dr Meghna Raj", "987445676", "Oncologist"),
  Doctor.constructor2(
      "Dr Paresh Kumar", "98765434567", "General Pracitioner"),
  Doctor.constructor2("Dr Jeet Singh", "87654567887", "Nephrologist")
];