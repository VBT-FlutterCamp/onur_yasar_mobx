import 'package:flutter/material.dart';
import 'package:flutter_makeup/core/base/base_view.dart';
import 'package:flutter_makeup/feature/home/viewmodel/makeup_view_model.dart';
import 'package:flutter_makeup/product/constants/app_text_constant.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeupView extends StatelessWidget {
  const MakeupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MakeupViewModel>(
        viewModel: MakeupViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, MakeupViewModel makeupViewModel) {
          return Scaffold(
              appBar: _buildAppbar,
              body: Observer(
                builder: ((_) {
                  return makeupViewModel.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _buildBody(makeupViewModel, context);
                }),
              ));
        });
  }

  Widget _buildBody(MakeupViewModel makeupViewModel, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            AppText().productName,
            style: context.textTheme.headline3,
          ),
        ),
        Expanded(
          flex: 9,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
              ),
              itemCount: makeupViewModel.makeupModel?.length,
              itemBuilder: (context, index) {
                return _buildCard(context, makeupViewModel, index);
              }),
        ),
      ],
    );
  }

  Widget _buildCard(
      BuildContext context, MakeupViewModel makeupViewModel, int index) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: context.lowBorderRadius,
        ),
        color: context.appTheme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCardImage(makeupViewModel, index, context),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            _buildCardText(makeupViewModel, index, context),
            _buildCardButton(context, makeupViewModel, index),
          ],
        ),
      ),
    );
  }

  Expanded _buildCardButton(
      BuildContext context, MakeupViewModel makeupViewModel, int index) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.dynamicWidth(0.3),
              height: context.dynamicHeight(0.05),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.appTheme.scaffoldBackgroundColor,
                ),
                onPressed: () {
                  _launchURL(context, makeupViewModel, index);
                },
                child: Text(
                  AppText().buttonText,
                  style: context.textTheme.bodyText2?.copyWith(
                    color: context.appTheme.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardText(
      MakeupViewModel makeupViewModel, int index, BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Expanded(
        flex: 1,
        child: Text(
          makeupViewModel.makeupModel?[index].name ?? "name",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCardImage(
      MakeupViewModel makeupViewModel, int index, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.verticalPaddingLow,
        child: SizedBox(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.2),
          child: Image.network(
            makeupViewModel.makeupModel?[index].imageLink ?? AppText().imgUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  AppBar get _buildAppbar => AppBar(
        title: Text(AppText().appbarText),
      );

  void _launchURL(
      BuildContext context, MakeupViewModel makeupViewModel, int index) async {
    String url = makeupViewModel.makeupModel?[index].productLink ?? "";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw AppText().urlNotFound;
    }
  }
}
