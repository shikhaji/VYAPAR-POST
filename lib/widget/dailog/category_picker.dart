import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/models/get_all_category_model.dart';
import 'package:vyapar_post/models/get_all_category_model.dart';

import '../../models/city_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_color.dart';
import '../../utils/app_sizes.dart';
import '../custom_sized_box.dart';
import '../primary_textfield.dart';

class CategoryPickerDailog extends StatefulWidget {
  final String id;
  const CategoryPickerDailog({
    super.key,
    required this.id,
  });

  static Future<Category> show(BuildContext context, String id) async {
    return await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CategoryPickerDailog(id: id),
    );
  }

  @override
  State<CategoryPickerDailog> createState() => _StatePickerDailogState();
}

class _StatePickerDailogState extends State<CategoryPickerDailog> {
  final TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;

  List<Category> _city = [];
  List<Category> _cityResponse = [];

  @override
  void initState() {
    super.initState();
    fetchState();
  }

  Future<void> fetchState() async {
    GetAllCategoryModel? response = await ApiService().getAllCategory(context,1);
    if (response != null) {
      if (response != null) {
        _city = response.message!.category
            .map((e) => Category.fromJson(e.toJson()))
            .toList();
        _cityResponse = response.message!.category
            .map((e) => Category.fromJson(e.toJson()))
            .toList();
        setState(() {});
      }
    } else {
      print("first select state");
    }
  }

  Future<void> _onSearchHandler(String qurey) async {
    if (qurey.isNotEmpty) {
      _isSearching = true;
      _city = _isSearching ? serachCountry(qurey) : _city;
    } else {
      _city.clear();
      _city = _cityResponse;
      _isSearching = false;
    }
    setState(() {});
  }

  List<Category> serachCountry(String qurey) {
    return _cityResponse
        .where(
            (e) => e.brandName!.toLowerCase().contains(qurey.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
        insetPadding: EdgeInsets.all(Sizes.s20.h),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.s12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.s14.w,
            vertical: Sizes.s20.h,
          ),
          child: Column(
            children: [
              PrimaryTextField(
                controller: _searchController,
                onChanged: _onSearchHandler,
                hintText: 'Search category',
                color: AppColor.textFieldColor,
                suffix: _isSearching
                    ? InkWell(
                  onTap: () {
                    _searchController.clear();
                    _isSearching = false;
                    _city.clear();
                    _city = _cityResponse;
                    setState(() {});
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  ),
                )
                    : null,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _city.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.s16.w,
                    vertical: Sizes.s20.h,
                  ),
                  itemBuilder: (context, index) {
                    Category getAllCategoryModel = _city[index];
                    return _CountryStateListTile(
                      getAllCategoryModel: getAllCategoryModel,
                      onTap: () {
                        Navigator.pop(context, getAllCategoryModel);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountryStateListTile extends StatelessWidget {
  final Category getAllCategoryModel;
  final VoidCallback onTap;
  const _CountryStateListTile({
    required this.getAllCategoryModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxH8(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.s12.h, vertical: Sizes.s18.h),
              decoration: BoxDecoration(
                  color: AppColor.textFieldColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                getAllCategoryModel.brandName ?? '',
                style: TextStyle(
                  fontSize: Sizes.s16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ));
  }
}
