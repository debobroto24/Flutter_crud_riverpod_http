import 'package:flutte_crud_riverpod_http/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key}) : super(key: key);

//   @override
//   State<UserListScreen> createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   List<String> items = ["1", "2", "3", "4"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("UserList")),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return const Card(
//             color: Colors.greenAccent,
//             elevation: 2.0,
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: ListTile(
//                 title: Text("hel"),
//                 trailing: Icon(Icons.ac_unit_outlined),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("User List")),
        body: Center(
          child: Column(
            children: [
              Text("test"),
              UserListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserListView extends ConsumerWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listUsers = ref.watch(userList);
    return listUsers.when(
        data: (user) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(userList);
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: user.data.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: ListTile(
                        title: Text(user.data[index].firstName),
                        subtitle: Text(user.data[index].email),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage(user.data[index].avatar),
                          ),
                        ),
                        // ,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        error: (err, stack) => Text('error $err'),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}
