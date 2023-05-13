import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import 'package:giga_chat/consts/assets.dart';
import 'package:giga_chat/consts/colors.dart';
import 'package:giga_chat/consts/links.dart';
import 'package:giga_chat/data_provider/data_provider.dart';
import 'package:giga_chat/models/chat_item.dart';
import 'package:giga_chat/ui/get_message_time.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<List<ChatItem>> _chatListFuture;
  @override
  void initState() {
    super.initState();
    _chatListFuture = DataProvider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(avatar),
            ),
            Text(
              AppLocalizations.of(context)!.chat,
            ),
            Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: SvgPicture.asset(chatAdd))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.black)),
                  width: sWidth * 0.7,
                  height: 48,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.search,
                      prefixIcon: const Icon(Icons.search_outlined),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 48,
                width: 56,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: pink)),
                child: SvgPicture.asset(filter),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ChatItem>>(
              future: _chatListFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final chatItems = snapshot.data!;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final chatItem = chatItems[index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            width: sWidth,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                chatItem.participants.length == 1
                                    ? SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                            chatItem.participants
                                                .map((e) => e.avatar)
                                                .join(),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Stack(children: [
                                          Positioned(
                                            right: 0,
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  chatItem
                                                      .participants[0].avatar),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  chatItem
                                                      .participants[1].avatar),
                                            ),
                                          ),
                                          if (chatItem.participants.length > 2)
                                            Positioned(
                                                top: 24,
                                                left: 12,
                                                child: Transform(
                                                  transform: Matrix4.identity()
                                                    ..scale(0.6),
                                                  child: Chip(
                                                    backgroundColor: timeBlue,
                                                    label: Text(
                                                      '+${chatItem.participants.length - 2}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    ),
                                                    shape: const StadiumBorder(
                                                        side: BorderSide(
                                                            color: Colors.white,
                                                            width: 2.0)),
                                                  ),
                                                ))
                                        ]),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: sWidth * 0.4,
                                        child: Text(
                                          chatItem.participants
                                              .map((p) => p.name)
                                              .join(', '),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${chatItem.lastMessage.sender}: ',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            SizedBox(
                                              width: sWidth * 0.45,
                                              child: Text(
                                                chatItem.lastMessage.message,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (chatItem.chip != null)
                                        Chip(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 8),
                                          label: Text(
                                            chatItem.chip!.label,
                                            style: TextStyle(
                                                color: Color(int.parse(
                                                    chatItem.chip!.textColor,
                                                    radix: 16))),
                                          ),
                                          backgroundColor: Color(int.parse(
                                              chatItem.chip!.backColor,
                                              radix: 16)),
                                        )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    getMessageTime(chatItem.date, context),
                                    style: const TextStyle(
                                      color: timeBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                        ],
                      );
                    },
                    itemCount: chatItems.length,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
