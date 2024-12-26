import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/exam.dart';
import '../widgets/exam_location_map.dart';
import 'add_exam_screen.dart';

class ExamScheduleScreen extends StatefulWidget {
  const ExamScheduleScreen({super.key});

  @override
  State<ExamScheduleScreen> createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  final Map<DateTime, List<Exam>> _examMap = {};
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  void _addExam(Exam exam) {
    setState(() {
      final normalizedDate =
      DateTime(exam.date.year, exam.date.month, exam.date.day);
      if (_examMap[normalizedDate] == null) {
        _examMap[normalizedDate] = [];
      }
      _examMap[normalizedDate]!.add(exam);
    });
  }

  List<Exam> _getAllExams() {
    List<Exam> allExams = [];
    _examMap.forEach((_, exams) {
      allExams.addAll(exams);
    });
    return allExams;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Schedule'),
        backgroundColor: Colors.blueGrey,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2100, 01, 01),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            eventLoader: (day) {
              final normalizedDate = DateTime(day.year, day.month, day.day);
              return _examMap[normalizedDate] ?? [];
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: true,
              rightChevronVisible: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueGrey.shade700,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    bottom: 1,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final exam = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddExamScreen(
                    initialDate: _selectedDay,
                  ),
                ),
              );
              if (exam != null) {
                _addExam(exam);
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
            ),
            child: const Text('Add Exam'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'All Scheduled Exams',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getAllExams().length,
              itemBuilder: (context, index) {
                final exam = _getAllExams()[index];
                return ListTile(
                  title: Text(exam.subject),
                  subtitle: Text(
                    '${DateFormat('dd-MM-yyyy').format(exam.date)} at ${exam.date.hour}:${exam.date.minute.toString().padLeft(2, '0')}',
                  ),
                  trailing: Tooltip(
                      message: 'View the location of the exam',
                      child: IconButton(
                        icon: const Icon(Icons.map),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamLocationMap(exam: exam),
                            ),
                          );
                        },
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}