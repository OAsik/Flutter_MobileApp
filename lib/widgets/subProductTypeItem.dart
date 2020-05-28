import "../models/subProductType.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../models/subProductDetail.dart";
import "../providers/subProductProvider.dart";
import "../screens/subProductDetailScreen.dart";
import "../providers/subProductDetailProvider.dart";

class SubProductTypeItem extends StatefulWidget {
  final SubProductType subProductType;
  final String subProductId;
  final Size deviceSize;

  SubProductTypeItem(
    this.subProductType,
    this.subProductId,
    this.deviceSize
  );

  _SubProductTypeItemState createState() => _SubProductTypeItemState();
}

class _SubProductTypeItemState extends State<SubProductTypeItem> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _expanded = false;

  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400)
    );
  }

  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  Widget build(BuildContext context) {
    List<SubProductDetail> _subProductDetailList = Provider.of<SubProductDetailProvider>(context, listen: false).getSubProductTypeSubProductDetails(widget.subProductId, widget.subProductType.id);
    final String subProductName = Provider.of<SubProductProvider>(context, listen: false).getSingleSubProductById(widget.subProductId).name;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: _expanded ? double.parse((_subProductDetailList.length * 95).toString()) : 80,
      child: Card(
        child: Container(
          color: Theme.of(context).primaryColorLight,
          child: Padding(
            padding: EdgeInsets.only(top: 7),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_subProductDetailList.length == 1) {
                      Navigator.of(context).pushNamed(
                        SubProductDetailScreen.routeName,
                        arguments: {
                          "subProductDetailId": _subProductDetailList[0].id,
                          "subProductName": subProductName
                        }
                      );
                    }
                  },
                  child: ListTile(
                    leading: Container(
                      width: widget.deviceSize.height * 0.08,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: widget.subProductType.picture,
                      )
                    ),
                    title: Text(
                      widget.subProductType.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).buttonColor.withOpacity(0.5)
                      )
                    ),
                    trailing: _subProductDetailList.length > 1 ?
                    RotationTransition(
                      turns: Tween(
                        begin: 0.0,
                        end: 0.5
                      ).animate(_animationController),
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).buttonColor.withOpacity(0.5),
                          size: 14
                        ),
                        onPressed: () {
                          _animationController.forward(
                            from: 0.0
                          );

                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                      ),
                    ) :
                    null
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.deviceSize.width * 0.045,
                    vertical: widget.deviceSize.height * 0.005
                  ),
                  height: _expanded ? double.parse((_subProductDetailList.length * 48).toString()) : 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: widget.deviceSize.height * 0.02
                    ),
                    child: ListView(
                      children: _subProductDetailList.map((subProductDetail) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            SubProductDetailScreen.routeName,
                            arguments: {
                              "subProductDetailId": subProductDetail.id,
                              "subProductName": subProductName
                            }
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: widget.deviceSize.height * 0.016
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.radio_button_checked,
                                color: Theme.of(context).buttonColor.withOpacity(0.5),
                                size: 14
                              ),
                              SizedBox(
                                width: widget.deviceSize.width * 0.015,
                              ),
                              Expanded(
                                child: Text(
                                  subProductDetail.name,
                                  style: TextStyle(
                                    color: Theme.of(context).buttonColor.withOpacity(0.5)
                                  )
                                )
                              )
                            ]
                          )
                        )
                      )).toList()
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}