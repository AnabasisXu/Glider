import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glider/item/cubit/item_cubit.dart';
import 'package:http/http.dart' as http;

class TranslateCommentsDialog extends StatefulWidget {
  const TranslateCommentsDialog({super.key, required this.itemCubit});

  final ItemCubit itemCubit;

  @override
  State<TranslateCommentsDialog> createState() =>
      _TranslateCommentsDialogState();
}

class _TranslateCommentsDialogState extends State<TranslateCommentsDialog> {
  bool _loading = true;
  String? _error;
  String? _translated;

  @override
  void initState() {
    super.initState();
    _translate();
  }

  Future<void> _translate() async {
    final text = widget.itemCubit.state.data?.text;
    if (text == null || text.isEmpty) {
      setState(() {
        _error = '没有可翻译的文本';
        _loading = false;
      });
      return;
    }

    try {
      final encoded = Uri.encodeComponent(text);
      final uri = Uri.parse(
        'https://translate.googleapis.com/translate_a/single'
        '?client=gtx&sl=auto&tl=zh-CN&dt=t&q=$encoded',
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        _translated = (data[0] as List<dynamic>)
            .map((e) => (e as List<dynamic>)[0] as String)
            .join();
      } else {
        _error = '翻译请求失败';
      }
    } on Object catch (e) {
      _error = '翻译失败: $e';
    }

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final original = widget.itemCubit.state.data?.text ?? '';

    return AlertDialog(
      title: const Text('翻译评论'),
      contentPadding: const EdgeInsets.all(16),
      content: SizedBox(
        width: double.maxFinite,
        child: _loading
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              )
            : _error != null
                ? Center(child: Text(_error!))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _translated!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          '原文',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          original,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
      ],
    );
  }
}
