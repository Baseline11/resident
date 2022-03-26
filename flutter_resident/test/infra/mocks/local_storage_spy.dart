import 'package:localstorage/localstorage.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageSpy extends Mock implements LocalStorage {
  LocalStorageSpy() {
    this.mockDelete();
    this.mockSave();
    this.mockReady();
  }

  When mockDeleteCall() => when(() => this.deleteItem(any()));
  void mockDelete() => this.mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError() => this.mockDeleteCall().thenThrow(Exception());

  When mockSaveCall() => when(() => this.setItem(any(), any()));
  void mockSave() => this.mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => this.mockSaveCall().thenThrow(Exception());

  When mockFetchCall() => when(() => this.getItem(any()));
  void mockFetch(dynamic data) =>
      this.mockFetchCall().thenAnswer((_) async => data);
  void mockFetchError() => this.mockFetchCall().thenThrow(Exception());

  When mockReadyCall() => when(() => this.ready);
  mockReady() => mockReadyCall().thenAnswer((_) async => true);
}
