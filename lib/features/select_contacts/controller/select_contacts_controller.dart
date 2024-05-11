
import 'package:chat_app/features/select_contacts/repository/select_contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return selectContactRepository.getContacts();
});

final selectContactControllerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return SelectContactsController(
      ref: ref,
      selectContactRepository: selectContactRepository
  );
});

class SelectContactsController {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SelectContactsController({
    required this.ref,
    required this.selectContactRepository
  });

  void selectContact(Contact selectContact, BuildContext context)  {
     selectContactRepository.selectContacts(selectContact, context);
  }
}