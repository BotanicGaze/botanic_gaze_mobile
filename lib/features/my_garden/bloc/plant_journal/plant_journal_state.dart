part of 'plant_journal_bloc.dart';

class PlantJournalState extends BaseBlocState with EquatableMixin {
  PlantJournalState({this.listPlantJournal = const []});

  final List<PlantJournalModel> listPlantJournal;

  @override
  List<Object> get props => [listPlantJournal];
}
