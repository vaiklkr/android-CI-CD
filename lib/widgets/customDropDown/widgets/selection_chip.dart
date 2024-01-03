import 'package:flutter/material.dart';

import '../models/chip_config.dart';
import '../models/value_item.dart';

/// [SelectionChip] is a selected option chip builder.
/// It is used to build the selected option chip.
class SelectionChip<T> extends StatelessWidget {
  final ChipConfig chipConfig;
  final Function(ValueItem<T>) onItemDelete;
  final ValueItem<T> item;

  const SelectionChip({
    Key? key,
    required this.chipConfig,
    required this.item,
    required this.onItemDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: chipConfig.padding,
      label: Text(item.label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(chipConfig.radius),
      ),
      deleteIcon: chipConfig.deleteIcon,
      deleteIconColor: chipConfig.deleteIconColor,
      labelPadding: chipConfig.labelPadding,
      backgroundColor:
          chipConfig.backgroundColor ?? Theme.of(context).primaryColor,
      labelStyle: chipConfig.labelStyle ??
          TextStyle(color: chipConfig.labelColor, fontSize: 14),
      onDeleted: () => onItemDelete(item),
    );
  }
}
