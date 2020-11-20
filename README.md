# Flutter Custom Inspector

[![pub package](https://img.shields.io/pub/v/custom_inspector?logo=dart&label=stable&style=flat-square)](https://pub.dev/packages/custom_inspector)
[![pub package](https://img.shields.io/pub/v/custom_inspector?color=42a012&include_prereleases&label=dev&logo=dart&style=flat-square)](https://pub.dev/packages/custom_inspector)
[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/flutter_custom_inspector?logo=github&style=flat-square)](https://github.com/fluttercandies/flutter_custom_inspector/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/fluttercandies/flutter_custom_inspector?logo=github&style=flat-square)](https://github.com/fluttercandies/flutter_custom_inspector/network)
[![Build status](https://img.shields.io/github/workflow/status/fluttercandies/flutter_custom_inspector/Build%20test?label=CI&logo=github&style=flat-square)](https://github.com/fluttercandies/flutter_custom_inspector/actions?query=workflow%3A%22Build+test%22)
[![CodeFactor](https://img.shields.io/codefactor/grade/github/fluttercandies/flutter_custom_inspector?logo=codefactor&logoColor=%23ffffff&style=flat-square)](https://www.codefactor.io/repository/github/fluttercandies/flutter_custom_inspector)
[![GitHub license](https://img.shields.io/github/license/fluttercandies/flutter_custom_inspector?style=flat-square)](https://github.com/fluttercandies/flutter_custom_inspector/blob/master/LICENSE)
<a target="_blank" href="https://jq.qq.com/?_wv=1027&k=5bcc0gy"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="FlutterCandies" title="FlutterCandies"></a>

A customizable inspector that can called directly through Flutter apps.

## Getting Started

Wrap the `InspectorWrapper` to your `WidgetsApp` (e.g. `MaterialApp` or `CupertinoApp`), then start
your customization!

## Parameters

| Name                               | Type                             | Description | Value |
| ---------------------------------- | -------------------------------- | ----------- | ----- |
| selectButtonBuilder                | InspectorSelectButtonBuilder     | Build the select button to toggle selection. | (See source code.) |
| tooltipBuilder                     | String Function(Element element) | The content that shows upon the selected element. | `Element.toShortString` |
| tooltipBackgroundColor             | Color                            | The background color for the tooltip. | `Color.fromARGB(230, 60, 60, 60)` |
| tooltipStyle                       | TextStyle                        | The text style for the tooltip. | (See source code.) |
| maxTooltipLines                    | int                              | The max lines limit for tooltips. | `5` |
| highlightedRenderObjectFillColor   | Color                            | The color that covers the selected object. | `Color.fromARGB(128, 128, 128, 255)` |
| highlightedRenderObjectBorderColor | Color                            | The border color that rounds the selected object. | `Color.fromARGB(128, 64, 64, 128)` |

![Screenshot](https://tva1.sinaimg.cn/large/0081Kckwgy1gkuhfkke7aj30u01qygr1.jpg)