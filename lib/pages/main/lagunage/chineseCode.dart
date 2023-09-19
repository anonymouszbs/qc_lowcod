import 'package:highlight/src/mode.dart';
import 'package:highlight/src/common_modes.dart';
// GENERATED CODE - DO NOT MODIFY BY HAND

final chinesecode = Mode(
    refs: {},
    illegal: "<\\/|#",
    aliases: ["jsp"],
    lexemes: "[\\u4e00-\\u9fffa-zA-Z0-9]+",//指定用于匹配的正则表达式
    keywords:
        "整数型 文本型 布尔值 数组型 IM通信操作1 高级列表框1 变量 变你 为 如果 否则 如果真 计次循环首",
    variants: [
  ],
  functions: [{"高级列表框1.":["🐣初始化","置图标尺寸","添加菜单项","添加菜单项2","置菜单项标记","取菜单项标记","取菜单项数量","修改菜单项","删除菜单项","清空菜单项","弹出菜单1","弹出菜单2","创建完毕","菜单被选择"]},{"IM通信操作1.":["发送信息","连接终端服务器"]}],
  contains: [
    Mode(
          className: "function",
          begin:
              "([À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*(<[À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*(\\s*,\\s*[À-ʸa-zA-Z_\$][À-ʸa-zA-Z_\$0-9]*)*>)?\\s+)+[a-zA-Z_]\\w*\\s*\\(",
          returnBegin: true,
          end: "[{;=]",
          excludeEnd: true,
          keywords:
              "false synchronized int abstract float private char boolean var static null if const for true while long strictfp finally protected import native final void enum else break transient catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private module requires exports do",
          contains: [
            Mode(
                begin: "[a-zA-Z_]\\w*\\s*\\(",
                returnBegin: true,
                relevance: 0,
                contains: [UNDERSCORE_TITLE_MODE]),
            Mode(
                className: "params",
                begin: "\\(",
                end: "\\)",
                keywords:
                    "false synchronized int abstract float private char boolean var static null if const for true while long strictfp finally protected import native final void enum else break transient catch instanceof byte super volatile case assert short package default double public try this switch continue throws protected public private module requires exports do",
                relevance: 0,
                contains: [
                  APOS_STRING_MODE,
                  QUOTE_STRING_MODE,
                  C_NUMBER_MODE,
                  C_BLOCK_COMMENT_MODE
                ]),
            C_LINE_COMMENT_MODE,
            C_BLOCK_COMMENT_MODE
          ]),
  ]
   );

