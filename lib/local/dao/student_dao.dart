import 'package:form_builder/local/app_database.dart';
import 'package:form_builder/local/model/student_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'student_dao.g.dart';

@UseDao(tables: [Students])
class StudentDao extends DatabaseAccessor<AppDatabase> with _$StudentDaoMixin {
  final AppDatabase appDatabase;
  StudentDao(this.appDatabase) : super(appDatabase);

  Stream<List<Student>> watchStudents() => select(students).watch();
  Future<List<Student>> getAllStudents() => select(students).get();
  Future insertStudent(Insertable<Student> student) =>
      into(students).insert(student);

  Future<Student> getStudent(int id) {
    return (select(students)..where((students) => students.id.equals(id)))
        .getSingle();
  }
}
