import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RainbowTableau extends StatelessWidget {
  RainbowTableau();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: RainbowTableauPainter());
  }
}

class RainbowTableauPainter extends CustomPainter {
  RainbowTableauPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-37.0000000000, -24.0000000000);

// 37:1 : rainbow_tableau (COMPONENT)
    var draw_37_1 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          37.0000000000,
          24.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:37,t:24,r:-37,b:-37,w:269,h:251) */;
      canvas.save();
      canvas.transform(Float64List.fromList([
        1.0000000000,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0000000000,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
        0.0,
        frame.left,
        frame.top,
        0.0,
        1.0
      ]));
      canvas.drawRect(Offset.zero & frame.size,
          (Paint()..color = _ColorCatalog.instance.color_0));

// 14:226 : Ellipse 6 (ELLIPSE)
      var draw_14_226 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(0.0, 0.0, 269.0000000000,
            251.0000000000) /* H:SCALE V:SCALE F:(l:0,t:0,r:0,b:0,w:269,h:251) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 269.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 251.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_0.transform(transform)];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_0;
          canvas.save();
          canvas.translate(-4.0000000000, 0.0);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_0);
        });
        canvas.restore();
      };
      draw_14_226(canvas, frame);

// 14:227 : mileage (GROUP)
      var draw_14_227 = (Canvas canvas, Rect container) {
// 14:228 : Rectangle 4 (RECTANGLE)
        var draw_14_228 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              55.0000000000,
              138.0000000000,
              160.0000000000,
              32.0000000000) /* H:SCALE V:SCALE F:(l:55,t:138,r:54,b:54,w:160,h:32) */;
          canvas.save();
          canvas.scale((container.width) / 269.0000000000,
              (container.height) / 251.0000000000);
          canvas.transform(Float64List.fromList([
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            frame.left,
            frame.top,
            0.0,
            1.0
          ]));
          var transform = Float64List.fromList([
            (frame.width / 160.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 32.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0
          ]);
          var fillGeometry = [
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(5)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          var strokes = [_PaintCatalog.instance.paint_2];
          var strokeGeometry = [
            _PathCatalog.instance.path_1.transform(transform)
          ];
          strokes.forEach((paint) {
            strokeGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_14_228(canvas, frame);

// 14:229 : Group 1 (GROUP)
        var draw_14_229 = (Canvas canvas, Rect container) {
// 14:230 : Ellipse 1 (ELLIPSE)
          var draw_14_230 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                64.0000000000,
                141.0000000000,
                26.0000000000,
                26.0000000000) /* H:SCALE V:SCALE F:(l:64,t:141,r:179,b:179,w:26,h:26) */;
            canvas.save();
            canvas.scale((container.width) / 269.0000000000,
                (container.height) / 251.0000000000);
            canvas.transform(Float64List.fromList([
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              frame.left,
              frame.top,
              0.0,
              1.0
            ]));
            var transform = Float64List.fromList([
              (frame.width / 26.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 26.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0
            ]);
            var fillGeometry = [
              _PathCatalog.instance.path_2.transform(transform)
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_3);
            });
            canvas.restore();
          };
          draw_14_230(canvas, frame);
        };
        draw_14_229(canvas, frame);

// 14:231 : Ellipse 2 (ELLIPSE)
        var draw_14_231 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              66.0000000000,
              143.0000000000,
              22.0000000000,
              22.0000000000) /* H:SCALE V:SCALE F:(l:66,t:143,r:181,b:181,w:22,h:22) */;
          canvas.save();
          canvas.scale((container.width) / 269.0000000000,
              (container.height) / 251.0000000000);
          canvas.transform(Float64List.fromList([
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            frame.left,
            frame.top,
            0.0,
            1.0
          ]));
          var transform = Float64List.fromList([
            (frame.width / 22.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 22.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0
          ]);
          var fillGeometry = [
            _PathCatalog.instance.path_3.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_14_231(canvas, frame);

// 14:232 : .fas.fa-flag-checkered (INSTANCE)
        var draw_14_232 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              70.0000000000,
              147.0000000000,
              14.0000000000,
              14.0000000000) /* H:SCALE V:SCALE F:(l:70,t:147,r:185,b:185,w:14,h:14) */;
          canvas.save();
          canvas.scale((container.width) / 269.0000000000,
              (container.height) / 251.0000000000);
          canvas.transform(Float64List.fromList([
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            frame.left,
            frame.top,
            0.0,
            1.0
          ]));
          canvas.drawRect(Offset.zero & frame.size,
              (Paint()..color = _ColorCatalog.instance.color_0));

// I14:232;7:4 : Vector (VECTOR)
          var draw_I14_232__7_4 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(0.0, 0.0, 14.0000000000,
                14.0000000000) /* H:SCALE V:SCALE F:(l:0,t:0,r:0,b:0,w:14,h:14) */;
            canvas.save();
            canvas.scale((container.width) / 14.0000000000,
                (container.height) / 14.0000000000);
            canvas.transform(Float64List.fromList([
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              frame.left,
              frame.top,
              0.0,
              1.0
            ]));
            var transform = Float64List.fromList([
              (frame.width / 14.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 14.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0
            ]);
            var fillGeometry = [
              _PathCatalog.instance.path_4.transform(transform)
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_1);
            });
            canvas.restore();
          };
          draw_I14_232__7_4(canvas, frame);
          canvas.restore();
        };
        draw_14_232(canvas, frame);

// 14:233 : 85 554 km (TEXT)
        var draw_14_233 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              92.0000000000,
              141.0000000000,
              94.0000000000,
              21.0000000000) /* H:SCALE V:SCALE F:(l:92,t:141,r:83,b:83,w:94,h:21) */;
          canvas.save();
          canvas.scale((container.width) / 269.0000000000,
              (container.height) / 251.0000000000);
          canvas.transform(Float64List.fromList([
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            frame.left,
            frame.top,
            0.0,
            1.0
          ]));
          var style_0 = _TextStyleCatalog.instance.ui_TextStyle_0;
          var paragraphStyle = ui.ParagraphStyle(
            fontFamily: 'Jura',
            textAlign: TextAlign.center,
            fontSize: 14.0000000000,
            fontWeight: FontWeight.w400,
          );
          var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
            ..pushStyle(style_0);
          paragraphBuilder.addText("85 554 km");
          var paragraph = paragraphBuilder.build();
          paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
          canvas.drawParagraph(paragraph, Offset.zero);
          canvas.restore();
        };
        draw_14_233(canvas, frame);

// 14:234 : .far.fa-edit (INSTANCE)
        var draw_14_234 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              188.0000000000,
              145.0000000000,
              19.0000000000,
              16.0000000000) /* H:SCALE V:SCALE F:(l:188,t:145,r:62,b:62,w:19,h:16) */;
          canvas.save();
          canvas.scale((container.width) / 269.0000000000,
              (container.height) / 251.0000000000);
          canvas.transform(Float64List.fromList([
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0000000000,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            frame.left,
            frame.top,
            0.0,
            1.0
          ]));
          canvas.drawRect(Offset.zero & frame.size,
              (Paint()..color = _ColorCatalog.instance.color_0));

// I14:234;7:7 : Vector (VECTOR)
          var draw_I14_234__7_7 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(0.0, 0.0, 19.0000000000,
                16.0000000000) /* H:SCALE V:SCALE F:(l:0,t:0,r:0,b:0,w:19,h:16) */;
            canvas.save();
            canvas.scale((container.width) / 19.0000000000,
                (container.height) / 16.0000000000);
            canvas.transform(Float64List.fromList([
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0000000000,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              frame.left,
              frame.top,
              0.0,
              1.0
            ]));
            var transform = Float64List.fromList([
              (frame.width / 19.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 16.0000000000),
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0
            ]);
            var fillGeometry = [
              _PathCatalog.instance.path_5.transform(transform)
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_4);
            });
            canvas.restore();
          };
          draw_I14_234__7_7(canvas, frame);
          canvas.restore();
        };
        draw_14_234(canvas, frame);
      };
      draw_14_227(canvas, frame);

// 14:235 : Ellipse 5 (ELLIPSE)
      var draw_14_235 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(0.0, 0.0, 269.0000000000,
            251.0000000000) /* H:SCALE V:SCALE F:(l:0,t:0,r:0,b:0,w:269,h:251) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 269.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 251.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_6.transform(transform)];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_1;
          canvas.save();
          canvas.translate(4.0000000000, 4.0000000000);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_5);
        });
        canvas.restore();
      };
      draw_14_235(canvas, frame);

// 14:236 : Ellipse 7 (ELLIPSE)
      var draw_14_236 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(0.0, 0.0, 269.0000000000,
            251.0000000000) /* H:SCALE V:SCALE F:(l:0,t:0,r:0,b:0,w:269,h:251) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 269.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 251.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_7.transform(transform)];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_2;
          canvas.save();
          canvas.translate(0.0, 4.0000000000);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_6);
        });
        canvas.restore();
      };
      draw_14_236(canvas, frame);

// 14:237 : Line 3 (LINE)
      var draw_14_237 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(244.0000000000, 125.0000000000, 10.0000000000,
            0.0) /* H:SCALE V:SCALE F:(l:244,t:125,r:15,b:15,w:10,h:0) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        canvas.restore();
      };
      draw_14_237(canvas, frame);

// 14:238 : Rectangle 7 (RECTANGLE)
      var draw_14_238 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(236.2853393555, 35.0000000000, 4.0000000000,
            136.0899658203) /* H:SCALE V:SCALE F:(l:236.28533935546875,t:35,r:28.71466064453125,b:28.71466064453125,w:4,h:136.0899658203125) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          0.6424865127,
          0.7662970424,
          0.0,
          0.0,
          -0.7662970424,
          0.6424865127,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 4.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 136.0899658203),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        canvas.restore();
      };
      draw_14_238(canvas, frame);

// 14:239 : Ellipse 8 (ELLIPSE)
      var draw_14_239 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(122.0000000000, 112.0000000000, 26.0000000000,
            26.0000000000) /* H:SCALE V:SCALE F:(l:122,t:112,r:121,b:121,w:26,h:26) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 26.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 26.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_8.transform(transform)];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_3;
          canvas.save();
          canvas.translate(0.0, -2.0000000000);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_7);
        });
        var strokes = [_PaintCatalog.instance.paint_8];
        var strokeGeometry = [
          _PathCatalog.instance.path_9.transform(transform)
        ];
        strokes.forEach((paint) {
          strokeGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_14_239(canvas, frame);

// 14:240 : Line 5 (VECTOR)
      var draw_14_240 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(16.5000000000, 16.4539794922, 235.0000000000,
            108.5461349487) /* H:SCALE V:SCALE F:(l:16.5,t:16.4539794921875,r:17.5,b:17.5,w:235,h:108.54613494873047) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0000000000,
          0.0,
          0.0,
          -0.0000000000,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 235.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 108.5461349487),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var strokes = [_PaintCatalog.instance.paint_9];
        var strokeGeometry = [
          _PathCatalog.instance.path_10.transform(transform)
        ];
        strokes.forEach((paint) {
          strokeGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_14_240(canvas, frame);

// 14:241 : Line 4 (LINE)
      var draw_14_241 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(192.0000000000, 39.0000000000, 10.2956295013,
            0.0) /* H:SCALE V:SCALE F:(l:192,t:39,r:66.70437049865723,b:66.70437049865723,w:10.295629501342773,h:0) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          0.4856429398,
          -0.8741573095,
          0.0,
          0.0,
          0.8741573095,
          0.4856429398,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        canvas.restore();
      };
      draw_14_241(canvas, frame);

// 14:242 : Line 2 (LINE)
      var draw_14_242 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(77.0000000000, 27.0000000000, 10.0000000000,
            0.0) /* H:SCALE V:SCALE F:(l:77,t:27,r:182,b:182,w:10,h:0) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          0.4856429100,
          0.8741572499,
          0.0,
          0.0,
          -0.8741572499,
          0.4856429100,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        canvas.restore();
      };
      draw_14_242(canvas, frame);

// 14:243 : Line 1 (LINE)
      var draw_14_243 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(14.0000000000, 126.0000000000, 10.0000000000,
            0.0) /* H:SCALE V:SCALE F:(l:14,t:126,r:245,b:245,w:10,h:0) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        canvas.restore();
      };
      draw_14_243(canvas, frame);

// 14:224 : Ellipse 9 (ELLIPSE)
      var draw_14_224 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(29.0000000000, 26.0000000000, 210.0000000000,
            200.0000000000) /* H:SCALE V:SCALE F:(l:29,t:26,r:30,b:30,w:210,h:200) */;
        canvas.save();
        canvas.scale((container.width) / 269.0000000000,
            (container.height) / 251.0000000000);
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0000000000,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 210.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 200.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_11.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(
              path,
              (Paint()
                ..shader = RadialGradient(
                        center: Alignment(0, -1.1102230246251565e-16),
                        radius: 0,
                        stops: [0, 0.00009999999747378752, 1],
                        colors: [
                          _ColorCatalog.instance.color_16,
                          _ColorCatalog.instance.color_17,
                          _ColorCatalog.instance.color_18
                        ],
                        tileMode: TileMode.clamp)
                    .createShader(Offset.zero & frame.size)));
        });
        canvas.restore();
      };
      draw_14_224(canvas, frame);
      canvas.restore();
    };
    draw_37_1(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(RainbowTableauPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(RainbowTableauPainter oldDelegate) {
    return false;
  }
}

class _PathCatalog {
  _PathCatalog() {
    this.path_0 = _build_0();
    this.path_1 = _build_1();
    this.path_2 = _build_2();
    this.path_3 = _build_3();
    this.path_4 = _build_4();
    this.path_5 = _build_5();
    this.path_6 = _build_6();
    this.path_7 = _build_7();
    this.path_8 = _build_8();
    this.path_9 = _build_9();
    this.path_10 = _build_10();
    this.path_11 = _build_11();
  }

  Path path_0;

  Path path_1;

  Path path_2;

  Path path_3;

  Path path_4;

  Path path_5;

  Path path_6;

  Path path_7;

  Path path_8;

  Path path_9;

  Path path_10;

  Path path_11;

  static final _PathCatalog instance = _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(268.9960000000, 126.4770000000);
    path.cubicTo(269.1760000000, 104.8800000000, 263.3800000000, 83.6057000000,
        252.1690000000, 64.7110000000);
    path.cubicTo(240.9570000000, 45.8162000000, 224.7100000000, 29.9410000000,
        204.9980000000, 18.6207000000);
    path.lineTo(197.9480000000, 29.3087000000);
    path.cubicTo(215.6890000000, 39.4969000000, 230.3120000000, 53.7846000000,
        240.4020000000, 70.7899000000);
    path.cubicTo(250.4920000000, 87.7951000000, 255.7090000000, 106.9420000000,
        255.5460000000, 126.3790000000);
    path.lineTo(268.9960000000, 126.4770000000);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(5.0000000000, 1.0000000000);
    path.lineTo(155.0000000000, 1.0000000000);
    path.lineTo(155.0000000000, -1.0000000000);
    path.lineTo(5.0000000000, -1.0000000000);
    path.lineTo(5.0000000000, 1.0000000000);
    path.close();
    path.moveTo(159.0000000000, 5.0000000000);
    path.lineTo(159.0000000000, 27.0000000000);
    path.lineTo(161.0000000000, 27.0000000000);
    path.lineTo(161.0000000000, 5.0000000000);
    path.lineTo(159.0000000000, 5.0000000000);
    path.close();
    path.moveTo(155.0000000000, 31.0000000000);
    path.lineTo(5.0000000000, 31.0000000000);
    path.lineTo(5.0000000000, 33.0000000000);
    path.lineTo(155.0000000000, 33.0000000000);
    path.lineTo(155.0000000000, 31.0000000000);
    path.close();
    path.moveTo(1.0000000000, 27.0000000000);
    path.lineTo(1.0000000000, 5.0000000000);
    path.lineTo(-1.0000000000, 5.0000000000);
    path.lineTo(-1.0000000000, 27.0000000000);
    path.lineTo(1.0000000000, 27.0000000000);
    path.close();
    path.moveTo(5.0000000000, 31.0000000000);
    path.cubicTo(2.7908600000, 31.0000000000, 1.0000000000, 29.2091000000,
        1.0000000000, 27.0000000000);
    path.lineTo(-1.0000000000, 27.0000000000);
    path.cubicTo(-1.0000000000, 30.3137000000, 1.6862900000, 33.0000000000,
        5.0000000000, 33.0000000000);
    path.lineTo(5.0000000000, 31.0000000000);
    path.close();
    path.moveTo(159.0000000000, 27.0000000000);
    path.cubicTo(159.0000000000, 29.2091000000, 157.2090000000, 31.0000000000,
        155.0000000000, 31.0000000000);
    path.lineTo(155.0000000000, 33.0000000000);
    path.cubicTo(158.3140000000, 33.0000000000, 161.0000000000, 30.3137000000,
        161.0000000000, 27.0000000000);
    path.lineTo(159.0000000000, 27.0000000000);
    path.close();
    path.moveTo(155.0000000000, 1.0000000000);
    path.cubicTo(157.2090000000, 1.0000000000, 159.0000000000, 2.7908600000,
        159.0000000000, 5.0000000000);
    path.lineTo(161.0000000000, 5.0000000000);
    path.cubicTo(161.0000000000, 1.6862900000, 158.3140000000, -1.0000000000,
        155.0000000000, -1.0000000000);
    path.lineTo(155.0000000000, 1.0000000000);
    path.close();
    path.moveTo(5.0000000000, -1.0000000000);
    path.cubicTo(1.6862900000, -1.0000000000, -1.0000000000, 1.6862900000,
        -1.0000000000, 5.0000000000);
    path.lineTo(1.0000000000, 5.0000000000);
    path.cubicTo(1.0000000000, 2.7908600000, 2.7908600000, 1.0000000000,
        5.0000000000, 1.0000000000);
    path.lineTo(5.0000000000, -1.0000000000);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(26.0000000000, 13.0000000000);
    path.cubicTo(26.0000000000, 20.1797000000, 20.1797000000, 26.0000000000,
        13.0000000000, 26.0000000000);
    path.cubicTo(
        5.8203000000, 26.0000000000, 0.0, 20.1797000000, 0.0, 13.0000000000);
    path.cubicTo(0.0, 5.8203000000, 5.8203000000, 0.0, 13.0000000000, 0.0);
    path.cubicTo(20.1797000000, 0.0, 26.0000000000, 5.8203000000, 26.0000000000,
        13.0000000000);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(22.0000000000, 11.0000000000);
    path.cubicTo(22.0000000000, 17.0751000000, 17.0751000000, 22.0000000000,
        11.0000000000, 22.0000000000);
    path.cubicTo(
        4.9248700000, 22.0000000000, 0.0, 17.0751000000, 0.0, 11.0000000000);
    path.cubicTo(0.0, 4.9248700000, 4.9248700000, 0.0, 11.0000000000, 0.0);
    path.cubicTo(17.0751000000, 0.0, 22.0000000000, 4.9248700000, 22.0000000000,
        11.0000000000);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(12.7365000000, 1.8300500000);
    path.cubicTo(13.3259000000, 1.5606100000, 14.0000000000, 1.9838100000,
        14.0000000000, 2.6234600000);
    path.lineTo(14.0000000000, 9.2707300000);
    path.cubicTo(14.0000000000, 9.5585500000, 13.8566000000, 9.8287400000,
        13.6155000000, 9.9914600000);
    path.cubicTo(12.6200000000, 10.6631000000, 11.5506000000, 11.1087000000,
        10.2126000000, 11.1087000000);
    path.cubicTo(8.3410800000, 11.1087000000, 7.1117200000, 10.1576000000,
        5.6231900000, 10.1576000000);
    path.cubicTo(4.2106100000, 10.1576000000, 3.2308600000, 10.4326000000,
        2.4444400000, 10.7625000000);
    path.lineTo(2.4444400000, 13.3438000000);
    path.cubicTo(2.4444400000, 13.7062000000, 2.1459700000, 14.0000000000,
        1.7777800000, 14.0000000000);
    path.lineTo(1.3333300000, 14.0000000000);
    path.cubicTo(0.9651390000, 14.0000000000, 0.6666670000, 13.7062000000,
        0.6666670000, 13.3438000000);
    path.lineTo(0.6666670000, 2.7875500000);
    path.cubicTo(
        0.2638060000, 2.5108300000, 0.0, 2.0514800000, 0.0, 1.5312400000);
    path.cubicTo(0.0, 0.6643350000, 0.7318060000, -0.0342987000, 1.6205000000,
        0.0013028700);
    path.cubicTo(2.4112800000, 0.0329670000, 3.0588100000, 0.6566780000,
        3.1080300000, 1.4342300000);
    path.cubicTo(3.1224700000, 1.6623300000, 3.0855300000, 1.8802000000,
        3.0084200000, 2.0785000000);
    path.cubicTo(3.5844200000, 1.8698700000, 4.2053600000, 1.7499900000,
        4.8985600000, 1.7499900000);
    path.cubicTo(6.7700300000, 1.7499900000, 7.9993900000, 2.7010900000,
        9.4879200000, 2.7010900000);
    path.cubicTo(10.6128000000, 2.7010900000, 11.7827000000, 2.2661600000,
        12.7365000000, 1.8300500000);
    path.lineTo(12.7365000000, 1.8300500000);
    path.close();
    path.moveTo(2.4444400000, 3.6812800000);
    path.lineTo(2.4444400000, 5.6087400000);
    path.cubicTo(3.2500000000, 5.3169900000, 3.8661100000, 5.1212100000,
        4.4888900000, 5.0369900000);
    path.lineTo(4.4888900000, 3.0799900000);
    path.cubicTo(3.8361100000, 3.1393300000, 3.3655600000, 3.3476900000,
        2.4444400000, 3.6812800000);
    path.lineTo(2.4444400000, 3.6812800000);
    path.close();
    path.moveTo(8.5777800000, 3.9325700000);
    path.cubicTo(7.8439700000, 3.8048200000, 7.1920600000, 3.5503300000,
        6.5333300000, 3.3490600000);
    path.lineTo(6.5333300000, 5.1925700000);
    path.cubicTo(7.2048600000, 5.3759400000, 7.8546100000, 5.6422100000,
        8.5777800000, 5.8026100000);
    path.lineTo(8.5777800000, 3.9325700000);
    path.close();
    path.moveTo(4.4888900000, 5.0369900000);
    path.lineTo(4.4888900000, 6.9521400000);
    path.cubicTo(5.3998900000, 6.8707100000, 5.9863900000, 6.9347800000,
        6.5333300000, 7.0560500000);
    path.lineTo(6.5333300000, 5.1925700000);
    path.cubicTo(5.8320300000, 5.0002100000, 5.2394200000, 4.9349100000,
        4.4888900000, 5.0369900000);
    path.lineTo(4.4888900000, 5.0369900000);
    path.close();
    path.moveTo(6.5333300000, 8.9260900000);
    path.cubicTo(7.2649400000, 9.0532900000, 7.9147800000, 9.3069100000,
        8.5777800000, 9.5096100000);
    path.lineTo(8.5777800000, 7.6663600000);
    path.cubicTo(7.9034200000, 7.4819000000, 7.2572200000, 7.2165600000,
        6.5333300000, 7.0560500000);
    path.lineTo(6.5333300000, 8.9260900000);
    path.lineTo(6.5333300000, 8.9260900000);
    path.close();
    path.moveTo(2.4444400000, 9.3542900000);
    path.cubicTo(3.1005600000, 9.1248800000, 3.7719400000, 8.9758600000,
        4.4888900000, 8.9014800000);
    path.lineTo(4.4888900000, 6.9521400000);
    path.cubicTo(3.7636100000, 7.0164000000, 3.1733300000, 7.1719900000,
        2.4444400000, 7.4268300000);
    path.lineTo(2.4444400000, 9.3542900000);
    path.close();
    path.moveTo(12.6667000000, 3.2949100000);
    path.cubicTo(12.0750000000, 3.5369100000, 11.3725000000, 3.7772600000,
        10.6222000000, 3.9093300000);
    path.lineTo(10.6222000000, 5.8756200000);
    path.cubicTo(11.3808000000, 5.7564000000, 12.0119000000, 5.4900700000,
        12.6667000000, 5.2223800000);
    path.lineTo(12.6667000000, 3.2949100000);
    path.lineTo(12.6667000000, 3.2949100000);
    path.close();
    path.moveTo(12.6667000000, 9.0360100000);
    path.lineTo(12.6667000000, 7.1085500000);
    path.cubicTo(12.0503000000, 7.4968300000, 11.3117000000, 7.7267900000,
        10.6222000000, 7.8200300000);
    path.lineTo(10.6222000000, 9.7773000000);
    path.cubicTo(11.3186000000, 9.7122200000, 11.9692000000, 9.4754300000,
        12.6667000000, 9.0360100000);
    path.lineTo(12.6667000000, 9.0360100000);
    path.close();
    path.moveTo(8.5777800000, 5.8026100000);
    path.lineTo(8.5777800000, 7.6663600000);
    path.cubicTo(9.2906700000, 7.8614300000, 9.8726700000, 7.9218100000,
        10.6222000000, 7.8200300000);
    path.lineTo(10.6222000000, 5.8756200000);
    path.cubicTo(9.9000300000, 5.9901100000, 9.2349200000, 5.9487900000,
        8.5777800000, 5.8026100000);
    path.lineTo(8.5777800000, 5.8026100000);
    path.close();
    return path;
  }

  static Path _build_5() {
    var path = Path();
    path.moveTo(13.2706000000, 10.7789000000);
    path.lineTo(14.3262000000, 9.7790400000);
    path.cubicTo(14.4911000000, 9.6228100000, 14.7781000000, 9.7321700000,
        14.7781000000, 9.9571400000);
    path.lineTo(14.7781000000, 14.5002000000);
    path.cubicTo(14.7781000000, 15.3282000000, 14.0689000000, 16.0000000000,
        13.1947000000, 16.0000000000);
    path.lineTo(1.5833700000, 16.0000000000);
    path.cubicTo(
        0.7092170000, 16.0000000000, 0.0, 15.3282000000, 0.0, 14.5002000000);
    path.lineTo(0.0, 3.5018300000);
    path.cubicTo(0.0, 2.6738300000, 0.7092170000, 2.0020500000, 1.5833700000,
        2.0020500000);
    path.lineTo(10.6053000000, 2.0020500000);
    path.cubicTo(10.8395000000, 2.0020500000, 10.9582000000, 2.2707600000,
        10.7933000000, 2.4301100000);
    path.lineTo(9.7377100000, 3.4299700000);
    path.cubicTo(9.6882300000, 3.4768300000, 9.6222600000, 3.5018300000,
        9.5496900000, 3.5018300000);
    path.lineTo(1.5833700000, 3.5018300000);
    path.lineTo(1.5833700000, 14.5002000000);
    path.lineTo(13.1947000000, 14.5002000000);
    path.lineTo(13.1947000000, 10.9539000000);
    path.cubicTo(13.1947000000, 10.8882000000, 13.2211000000, 10.8258000000,
        13.2706000000, 10.7789000000);
    path.close();
    path.moveTo(18.4363000000, 4.4735600000);
    path.lineTo(9.7740000000, 12.6786000000);
    path.lineTo(6.7919900000, 12.9911000000);
    path.cubicTo(5.9277300000, 13.0817000000, 5.1921300000, 12.3912000000,
        5.2877900000, 11.5663000000);
    path.lineTo(5.6176600000, 8.7416900000);
    path.lineTo(14.2800000000, 0.5366400000);
    path.cubicTo(15.0354000000, -0.1788800000, 16.2559000000, -0.1788800000,
        17.0080000000, 0.5366400000);
    path.lineTo(18.4330000000, 1.8864400000);
    path.cubicTo(19.1884000000, 2.6019600000, 19.1884000000, 3.7611700000,
        18.4363000000, 4.4735600000);
    path.close();
    path.moveTo(15.1772000000, 5.4390500000);
    path.lineTo(13.2607000000, 3.6236900000);
    path.lineTo(7.1317500000, 9.4322100000);
    path.lineTo(6.8909500000, 11.4725000000);
    path.lineTo(9.0449900000, 11.2444000000);
    path.lineTo(15.1772000000, 5.4390500000);
    path.close();
    path.moveTo(17.3148000000, 2.9487900000);
    path.lineTo(15.8898000000, 1.5989800000);
    path.cubicTo(15.7545000000, 1.4708800000, 15.5335000000, 1.4708800000,
        15.4015000000, 1.5989800000);
    path.lineTo(14.3823000000, 2.5644700000);
    path.lineTo(16.2988000000, 4.3798300000);
    path.lineTo(17.3181000000, 3.4143400000);
    path.cubicTo(17.4500000000, 3.2831100000, 17.4500000000, 3.0768900000,
        17.3148000000, 2.9487900000);
    path.close();
    return path;
  }

  static Path _build_6() {
    var path = Path();
    path.moveTo(71.3561000000, 14.6901000000);
    path.cubicTo(49.7249000000, 25.4220000000, 31.6459000000, 41.4628000000,
        19.0707000000, 61.0811000000);
    path.cubicTo(6.4954700000, 80.6994000000, -0.0983095000, 103.1500000000,
        0.0011074500, 126.0090000000);
    path.lineTo(13.4510000000, 125.9580000000);
    path.cubicTo(13.3615000000, 105.3850000000, 19.2959000000, 85.1795000000,
        30.6136000000, 67.5230000000);
    path.cubicTo(41.9313000000, 49.8666000000, 58.2024000000, 35.4298000000,
        77.6705000000, 25.7711000000);
    path.lineTo(71.3561000000, 14.6901000000);
    path.close();
    return path;
  }

  static Path _build_7() {
    var path = Path();
    path.moveTo(204.9600000000, 18.5991000000);
    path.cubicTo(184.9150000000, 7.0961000000, 161.9860000000, 0.7017040000,
        138.4640000000, 0.0545231000);
    path.cubicTo(114.9420000000, -0.5926570000, 91.6494000000, 4.5300300000,
        70.9129000000, 14.9109000000);
    path.lineTo(77.2716000000, 25.9699000000);
    path.cubicTo(95.9345000000, 16.6270000000, 116.8980000000, 12.0166000000,
        138.0680000000, 12.5991000000);
    path.cubicTo(159.2380000000, 13.1815000000, 179.8740000000, 18.9365000000,
        197.9140000000, 29.2892000000);
    path.lineTo(204.9600000000, 18.5991000000);
    path.close();
    return path;
  }

  static Path _build_8() {
    var path = Path();
    path.moveTo(26.0000000000, 13.0000000000);
    path.cubicTo(26.0000000000, 9.5521900000, 24.6304000000, 6.2455800000,
        22.1924000000, 3.8076100000);
    path.cubicTo(19.7544000000, 1.3696400000, 16.4478000000, 0.0000002603,
        13.0000000000, 0.0000000000);
    path.cubicTo(9.5521900000, -0.0000002603, 6.2455900000, 1.3696400000,
        3.8076100000, 3.8076100000);
    path.cubicTo(1.3696400000, 6.2455800000, 0.0000005206, 9.5521800000,
        0.0000000000, 13.0000000000);
    path.lineTo(13.0000000000, 13.0000000000);
    path.lineTo(26.0000000000, 13.0000000000);
    path.close();
    return path;
  }

  static Path _build_9() {
    var path = Path();
    path.moveTo(26.0000000000, 13.0000000000);
    path.lineTo(26.0000000000, 15.0000000000);
    path.lineTo(28.0000000000, 15.0000000000);
    path.lineTo(28.0000000000, 13.0000000000);
    path.lineTo(26.0000000000, 13.0000000000);
    path.close();
    path.moveTo(22.1924000000, 3.8076100000);
    path.lineTo(20.7782000000, 5.2218300000);
    path.lineTo(22.1924000000, 3.8076100000);
    path.close();
    path.moveTo(0.0000000000, 13.0000000000);
    path.lineTo(-2.0000000000, 13.0000000000);
    path.lineTo(-2.0000000000, 15.0000000000);
    path.lineTo(-0.0000003020, 15.0000000000);
    path.lineTo(0.0000000000, 13.0000000000);
    path.close();
    path.moveTo(13.0000000000, 13.0000000000);
    path.lineTo(13.0000000000, 15.0000000000);
    path.lineTo(13.0000000000, 13.0000000000);
    path.close();
    path.moveTo(28.0000000000, 13.0000000000);
    path.cubicTo(28.0000000000, 9.0217500000, 26.4196000000, 5.2064400000,
        23.6066000000, 2.3934000000);
    path.lineTo(20.7782000000, 5.2218300000);
    path.cubicTo(22.8411000000, 7.2847300000, 24.0000000000, 10.0826000000,
        24.0000000000, 13.0000000000);
    path.lineTo(28.0000000000, 13.0000000000);
    path.close();
    path.moveTo(23.6066000000, 2.3934000000);
    path.cubicTo(20.7936000000, -0.4196470000, 16.9782000000, -2.0000000000,
        13.0000000000, -2.0000000000);
    path.lineTo(13.0000000000, 2.0000000000);
    path.cubicTo(15.9174000000, 2.0000000000, 18.7153000000, 3.1589300000,
        20.7782000000, 5.2218300000);
    path.lineTo(23.6066000000, 2.3934000000);
    path.close();
    path.moveTo(13.0000000000, -2.0000000000);
    path.cubicTo(9.0217500000, -2.0000000000, 5.2064500000, -0.4196480000,
        2.3934000000, 2.3934000000);
    path.lineTo(5.2218300000, 5.2218200000);
    path.cubicTo(7.2847300000, 3.1589200000, 10.0826000000, 2.0000000000,
        13.0000000000, 2.0000000000);
    path.lineTo(13.0000000000, -2.0000000000);
    path.close();
    path.moveTo(2.3934000000, 2.3934000000);
    path.cubicTo(-0.4196460000, 5.2064400000, -2.0000000000, 9.0217500000,
        -2.0000000000, 13.0000000000);
    path.lineTo(2.0000000000, 13.0000000000);
    path.cubicTo(2.0000000000, 10.0826000000, 3.1589300000, 7.2847200000,
        5.2218300000, 5.2218200000);
    path.lineTo(2.3934000000, 2.3934000000);
    path.close();
    path.moveTo(-0.0000003020, 15.0000000000);
    path.lineTo(13.0000000000, 15.0000000000);
    path.lineTo(13.0000000000, 11.0000000000);
    path.lineTo(0.0000003020, 11.0000000000);
    path.lineTo(-0.0000003020, 15.0000000000);
    path.close();
    path.moveTo(13.0000000000, 15.0000000000);
    path.lineTo(26.0000000000, 15.0000000000);
    path.lineTo(26.0000000000, 11.0000000000);
    path.lineTo(13.0000000000, 11.0000000000);
    path.lineTo(13.0000000000, 15.0000000000);
    path.close();
    return path;
  }

  static Path _build_10() {
    var path = Path();
    path.moveTo(2.4826000000, 108.8410000000);
    path.cubicTo(2.5025500000, 108.6720000000, 2.5227200000, 108.5040000000,
        2.5431200000, 108.3370000000);
    path.lineTo(-2.4203000000, 107.7330000000);
    path.cubicTo(-2.4413100000, 107.9060000000, -2.4620700000, 108.0790000000,
        -2.4826000000, 108.2520000000);
    path.lineTo(2.4826000000, 108.8410000000);
    path.close();
    path.moveTo(3.2231000000, 103.3690000000);
    path.cubicTo(3.2729200000, 103.0420000000, 3.3236300000, 102.7160000000,
        3.3752300000, 102.3910000000);
    path.lineTo(-1.5629800000, 101.6070000000);
    path.cubicTo(-1.6161800000, 101.9420000000, -1.6684600000, 102.2780000000,
        -1.7198200000, 102.6150000000);
    path.lineTo(3.2231000000, 103.3690000000);
    path.close();
    path.moveTo(4.2151400000, 97.5779000000);
    path.cubicTo(4.2754900000, 97.2614000000, 4.3367100000, 96.9457000000,
        4.3987900000, 96.6308000000);
    path.lineTo(-0.5067780000, 95.6636000000);
    path.cubicTo(-0.5708830000, 95.9888000000, -0.6340910000, 96.3148000000,
        -0.6963990000, 96.6416000000);
    path.lineTo(4.2151400000, 97.5779000000);
    path.close();
    path.moveTo(5.4342000000, 91.7974000000);
    path.cubicTo(5.5092800000, 91.4733000000, 5.5852900000, 91.1502000000,
        5.6622300000, 90.8280000000);
    path.lineTo(0.7990020000, 89.6665000000);
    path.cubicTo(0.7194160000, 89.9998000000, 0.6408080000, 90.3339000000,
        0.5631810000, 90.6691000000);
    path.lineTo(5.4342000000, 91.7974000000);
    path.close();
    path.moveTo(6.8858000000, 86.0665000000);
    path.cubicTo(6.9719500000, 85.7538000000, 7.0590100000, 85.4421000000,
        7.1469800000, 85.1313000000);
    path.lineTo(2.3359600000, 83.7696000000);
    path.cubicTo(2.2448300000, 84.0916000000, 2.1546500000, 84.4145000000,
        2.0654200000, 84.7384000000);
    path.lineTo(6.8858000000, 86.0665000000);
    path.close();
    path.moveTo(8.5605100000, 80.4562000000);
    path.cubicTo(8.6627400000, 80.1388000000, 8.7659500000, 79.8225000000,
        8.8701200000, 79.5072000000);
    path.lineTo(4.1225700000, 77.9386000000);
    path.cubicTo(4.0144700000, 78.2657000000, 3.9074000000, 78.5939000000,
        3.8013500000, 78.9231000000);
    path.lineTo(8.5605100000, 80.4562000000);
    path.close();
    path.moveTo(10.5045000000, 74.8560000000);
    path.cubicTo(10.6182000000, 74.5511000000, 10.7328000000, 74.2472000000,
        10.8484000000, 73.9444000000);
    path.lineTo(6.1769600000, 72.1618000000);
    path.cubicTo(6.0568600000, 72.4765000000, 5.9377400000, 72.7923000000,
        5.8196100000, 73.1091000000);
    path.lineTo(10.5045000000, 74.8560000000);
    path.close();
    path.moveTo(12.6675000000, 69.4405000000);
    path.cubicTo(12.7982000000, 69.1341000000, 12.9299000000, 68.8289000000,
        13.0626000000, 68.5249000000);
    path.lineTo(8.4799500000, 66.5250000000);
    path.cubicTo(8.3418300000, 66.8415000000, 8.2047500000, 67.1591000000,
        8.0687200000, 67.4779000000);
    path.lineTo(12.6675000000, 69.4405000000);
    path.close();
    path.moveTo(15.1259000000, 64.0478000000);
    path.cubicTo(15.2682000000, 63.7549000000, 15.4115000000, 63.4632000000,
        15.5557000000, 63.1725000000);
    path.lineTo(11.0769000000, 60.9499000000);
    path.cubicTo(10.9266000000, 61.2528000000, 10.7772000000, 61.5569000000,
        10.6289000000, 61.8622000000);
    path.lineTo(15.1259000000, 64.0478000000);
    path.close();
    path.moveTo(17.8024000000, 58.8718000000);
    path.cubicTo(17.9622000000, 58.5809000000, 18.1230000000, 58.2913000000,
        18.2847000000, 58.0028000000);
    path.lineTo(13.9235000000, 55.5575000000);
    path.cubicTo(13.7547000000, 55.8586000000, 13.5869000000, 56.1609000000,
        13.4201000000, 56.4644000000);
    path.lineTo(17.8024000000, 58.8718000000);
    path.close();
    path.moveTo(20.7831000000, 53.7652000000);
    path.cubicTo(20.9544000000, 53.4887000000, 21.1266000000, 53.2133000000,
        21.2998000000, 52.9391000000);
    path.lineTo(17.0724000000, 50.2691000000);
    path.cubicTo(16.8914000000, 50.5556000000, 16.7114000000, 50.8433000000,
        16.5325000000, 51.1323000000);
    path.lineTo(20.7831000000, 53.7652000000);
    path.close();
    path.moveTo(23.9842000000, 48.8891000000);
    path.cubicTo(24.1727000000, 48.6179000000, 24.3622000000, 48.3480000000,
        24.5526000000, 48.0794000000);
    path.lineTo(20.4732000000, 45.1882000000);
    path.cubicTo(20.2741000000, 45.4692000000, 20.0759000000, 45.7515000000,
        19.8788000000, 46.0351000000);
    path.lineTo(23.9842000000, 48.8891000000);
    path.close();
    path.moveTo(27.4786000000, 44.1435000000);
    path.cubicTo(27.6782000000, 43.8873000000, 27.8788000000, 43.6324000000,
        28.0803000000, 43.3787000000);
    path.lineTo(24.1648000000, 40.2691000000);
    path.cubicTo(23.9539000000, 40.5347000000, 23.7440000000, 40.8016000000,
        23.5350000000, 41.0697000000);
    path.lineTo(27.4786000000, 44.1435000000);
    path.close();
    path.moveTo(31.1957000000, 39.6352000000);
    path.cubicTo(31.4117000000, 39.3875000000, 31.6285000000, 39.1412000000,
        31.8463000000, 38.8961000000);
    path.lineTo(28.1085000000, 35.5751000000);
    path.cubicTo(27.8804000000, 35.8318000000, 27.6533000000, 36.0898000000,
        27.4271000000, 36.3492000000);
    path.lineTo(31.1957000000, 39.6352000000);
    path.close();
    path.moveTo(35.1785000000, 35.3169000000);
    path.cubicTo(35.4050000000, 35.0847000000, 35.6324000000, 34.8539000000,
        35.8606000000, 34.6242000000);
    path.lineTo(32.3141000000, 31.0997000000);
    path.cubicTo(32.0750000000, 31.3403000000, 31.8368000000, 31.5822000000,
        31.5995000000, 31.8255000000);
    path.lineTo(35.1785000000, 35.3169000000);
    path.close();
    path.moveTo(39.3819000000, 31.2429000000);
    path.cubicTo(39.6232000000, 31.0219000000, 39.8653000000, 30.8021000000,
        40.1082000000, 30.5837000000);
    path.lineTo(36.7653000000, 26.8656000000);
    path.cubicTo(36.5107000000, 27.0945000000, 36.2570000000, 27.3247000000,
        36.0041000000, 27.5564000000);
    path.lineTo(39.3819000000, 31.2429000000);
    path.close();
    path.moveTo(43.8130000000, 27.4064000000);
    path.cubicTo(44.0639000000, 27.2012000000, 44.3157000000, 26.9972000000,
        44.5682000000, 26.7946000000);
    path.lineTo(41.4390000000, 22.8948000000);
    path.cubicTo(41.1744000000, 23.1072000000, 40.9106000000, 23.3209000000,
        40.6476000000, 23.5359000000);
    path.lineTo(43.8130000000, 27.4064000000);
    path.close();
    path.moveTo(48.4538000000, 23.8234000000);
    path.cubicTo(48.7176000000, 23.6313000000, 48.9822000000, 23.4405000000,
        49.2475000000, 23.2510000000);
    path.lineTo(46.3416000000, 19.1821000000);
    path.cubicTo(46.0637000000, 19.3805000000, 45.7866000000, 19.5804000000,
        45.5102000000, 19.7817000000);
    path.lineTo(48.4538000000, 23.8234000000);
    path.close();
    path.moveTo(53.2810000000, 20.5092000000);
    path.cubicTo(53.5534000000, 20.3330000000, 53.8265000000, 20.1582000000,
        54.1003000000, 19.9848000000);
    path.lineTo(51.4243000000, 15.7612000000);
    path.cubicTo(51.1376000000, 15.9428000000, 50.8516000000, 16.1259000000,
        50.5663000000, 16.3103000000);
    path.lineTo(53.2810000000, 20.5092000000);
    path.close();
    path.moveTo(58.2970000000, 17.4592000000);
    path.cubicTo(58.5801000000, 17.2975000000, 58.8638000000, 17.1372000000,
        59.1482000000, 16.9782000000);
    path.lineTo(56.7085000000, 12.6139000000);
    path.cubicTo(56.4109000000, 12.7802000000, 56.1139000000, 12.9480000000,
        55.8176000000, 13.1172000000);
    path.lineTo(58.2970000000, 17.4592000000);
    path.close();
    path.moveTo(63.4620000000, 14.6932000000);
    path.cubicTo(63.7541000000, 14.5468000000, 64.0468000000, 14.4017000000,
        64.3401000000, 14.2580000000);
    path.lineTo(62.1400000000, 9.7680800000);
    path.cubicTo(61.8333000000, 9.9183800000, 61.5271000000, 10.0701000000,
        61.2216000000, 10.2232000000);
    path.lineTo(63.4620000000, 14.6932000000);
    path.close();
    path.moveTo(68.7819000000, 12.2030000000);
    path.cubicTo(69.0807000000, 12.0728000000, 69.3801000000, 11.9438000000,
        69.6800000000, 11.8162000000);
    path.lineTo(67.7223000000, 7.2153800000);
    path.cubicTo(67.4089000000, 7.3487400000, 67.0960000000, 7.4835100000,
        66.7837000000, 7.6196800000);
    path.lineTo(68.7819000000, 12.2030000000);
    path.close();
    path.moveTo(74.2213000000, 10.0002000000);
    path.cubicTo(74.5271000000, 9.8855800000, 74.8333000000, 9.7723200000,
        75.1400000000, 9.6603900000);
    path.lineTo(73.4257000000, 4.9634400000);
    path.cubicTo(73.1055000000, 5.0803200000, 72.7857000000, 5.1985900000,
        72.4664000000, 5.3182800000);
    path.lineTo(74.2213000000, 10.0002000000);
    path.close();
    path.moveTo(79.7735000000, 8.0813600000);
    path.cubicTo(80.0846000000, 7.9827400000, 80.3960000000, 7.8854500000,
        80.7079000000, 7.7894800000);
    path.lineTo(79.2373000000, 3.0106400000);
    path.cubicTo(78.9119000000, 3.1107700000, 78.5869000000, 3.2122900000,
        78.2624000000, 3.3152000000);
    path.lineTo(79.7735000000, 8.0813600000);
    path.close();
    path.moveTo(85.4175000000, 6.4483600000);
    path.cubicTo(85.7335000000, 6.3655300000, 86.0497000000, 6.2840200000,
        86.3663000000, 6.2038400000);
    path.lineTo(85.1387000000, 1.3568900000);
    path.cubicTo(84.8086000000, 1.4404800000, 84.4789000000, 1.5254600000,
        84.1495000000, 1.6118300000);
    path.lineTo(85.4175000000, 6.4483600000);
    path.close();
    path.moveTo(91.1393000000, 5.0997200000);
    path.cubicTo(91.4590000000, 5.0326800000, 91.7790000000, 4.9669500000,
        92.0993000000, 4.9025300000);
    path.lineTo(91.1133000000, 0.0007053760);
    path.cubicTo(90.7797000000, 0.0678185000, 90.4463000000, 0.1362990000,
        90.1132000000, 0.2061500000);
    path.lineTo(91.1393000000, 5.0997200000);
    path.close();
    path.moveTo(96.9224000000, 4.0342400000);
    path.cubicTo(97.2451000000, 3.9828700000, 97.5681000000, 3.9328000000,
        97.8913000000, 3.8840300000);
    path.lineTo(97.1452000000, -1.0599900000);
    path.cubicTo(96.8087000000, -1.0092200000, 96.4725000000, -0.9570930000,
        96.1365000000, -0.9036090000);
    path.lineTo(96.9224000000, 4.0342400000);
    path.close();
    path.moveTo(102.7530000000, 3.2497500000);
    path.cubicTo(103.0780000000, 3.2139500000, 103.4030000000, 3.1794400000,
        103.7280000000, 3.1462200000);
    path.lineTo(103.2200000000, -1.8278800000);
    path.cubicTo(102.8820000000, -1.7933200000, 102.5440000000, -1.7574100000,
        102.2050000000, -1.7201600000);
    path.lineTo(102.7530000000, 3.2497500000);
    path.close();
    path.moveTo(108.6150000000, 2.7442900000);
    path.cubicTo(108.9420000000, 2.7239100000, 109.2680000000, 2.7048100000,
        109.5950000000, 2.6869800000);
    path.lineTo(109.3220000000, -2.3055900000);
    path.cubicTo(108.9830000000, -2.2870500000, 108.6430000000, -2.2671800000,
        108.3040000000, -2.2459900000);
    path.lineTo(108.6150000000, 2.7442900000);
    path.close();
    path.moveTo(114.4970000000, 2.5152900000);
    path.cubicTo(114.8240000000, 2.5102100000, 115.1510000000, 2.5063900000,
        115.4790000000, 2.5038400000);
    path.lineTo(115.4400000000, -2.4960000000);
    path.cubicTo(115.1000000000, -2.4933600000, 114.7600000000, -2.4893900000,
        114.4200000000, -2.4841000000);
    path.lineTo(114.4970000000, 2.5152900000);
    path.close();
    path.moveTo(120.3840000000, 2.5604500000);
    path.cubicTo(120.7110000000, 2.5705300000, 121.0380000000, 2.5818700000,
        121.3650000000, 2.5944700000);
    path.lineTo(121.5580000000, -2.4018300000);
    path.cubicTo(121.2180000000, -2.4149200000, 120.8780000000, -2.4267000000,
        120.5380000000, -2.4371800000);
    path.lineTo(120.3840000000, 2.5604500000);
    path.close();
    path.moveTo(126.2640000000, 2.8774600000);
    path.cubicTo(126.5910000000, 2.9025900000, 126.9170000000, 2.9289600000,
        127.2430000000, 2.9565700000);
    path.lineTo(127.6650000000, -2.0255800000);
    path.cubicTo(127.3260000000, -2.0542800000, 126.9870000000, -2.0816700000,
        126.6480000000, -2.1077800000);
    path.lineTo(126.2640000000, 2.8774600000);
    path.close();
    path.moveTo(132.1230000000, 3.4640900000);
    path.cubicTo(132.4480000000, 3.5041200000, 132.7720000000, 3.5454000000,
        133.0970000000, 3.5879100000);
    path.lineTo(133.7470000000, -1.3696900000);
    path.cubicTo(133.4100000000, -1.4138500000, 133.0730000000, -1.4567300000,
        132.7350000000, -1.4983200000);
    path.lineTo(132.1230000000, 3.4640900000);
    path.close();
    path.moveTo(137.9510000000, 4.3185600000);
    path.cubicTo(138.2730000000, 4.3734300000, 138.5960000000, 4.4295300000,
        138.9180000000, 4.4868500000);
    path.lineTo(139.7940000000, -0.4358000000);
    path.cubicTo(139.4590000000, -0.4953520000, 139.1240000000, -0.5536300000,
        138.7890000000, -0.6106310000);
    path.lineTo(137.9510000000, 4.3185600000);
    path.close();
    path.moveTo(143.7300000000, 5.4385500000);
    path.cubicTo(144.0500000000, 5.5081900000, 144.3700000000, 5.5790500000,
        144.6890000000, 5.6511300000);
    path.lineTo(145.7900000000, 0.7738430000);
    path.cubicTo(145.4580000000, 0.6989490000, 145.1260000000, 0.6253230000,
        144.7940000000, 0.5529660000);
    path.lineTo(143.7300000000, 5.4385500000);
    path.close();
    path.moveTo(149.4550000000, 6.8234900000);
    path.cubicTo(149.7710000000, 6.9077100000, 150.0870000000, 6.9931400000,
        150.4020000000, 7.0797700000);
    path.lineTo(151.7270000000, 2.2584600000);
    path.cubicTo(151.3990000000, 2.1684200000, 151.0710000000, 2.0796300000,
        150.7430000000, 1.9921100000);
    path.lineTo(149.4550000000, 6.8234900000);
    path.close();
    path.moveTo(155.1060000000, 8.4707100000);
    path.cubicTo(155.4180000000, 8.5695800000, 155.7300000000, 8.6696500000,
        156.0410000000, 8.7709200000);
    path.lineTo(157.5880000000, 4.0164200000);
    path.cubicTo(157.2650000000, 3.9111300000, 156.9410000000, 3.8070900000,
        156.6170000000, 3.7043000000);
    path.lineTo(155.1060000000, 8.4707100000);
    path.close();
    path.moveTo(160.6740000000, 10.3798000000);
    path.cubicTo(160.9810000000, 10.4930000000, 161.2870000000, 10.6074000000,
        161.5920000000, 10.7230000000);
    path.lineTo(163.3620000000, 6.0465100000);
    path.cubicTo(163.0440000000, 5.9262500000, 162.7260000000, 5.8072400000,
        162.4070000000, 5.6894700000);
    path.lineTo(160.6740000000, 10.3798000000);
    path.close();
    path.moveTo(166.1450000000, 12.5490000000);
    path.cubicTo(166.4460000000, 12.6768000000, 166.7460000000, 12.8058000000,
        167.0460000000, 12.9359000000);
    path.lineTo(169.0360000000, 8.3490200000);
    path.cubicTo(168.7240000000, 8.2135800000, 168.4110000000, 8.0793800000,
        168.0980000000, 7.9464200000);
    path.lineTo(166.1450000000, 12.5490000000);
    path.close();
    path.moveTo(171.5010000000, 14.9762000000);
    path.cubicTo(171.7950000000, 15.1181000000, 172.0880000000, 15.2612000000,
        172.3810000000, 15.4054000000);
    path.lineTo(174.5910000000, 10.9202000000);
    path.cubicTo(174.2860000000, 10.7700000000, 173.9810000000, 10.6210000000,
        173.6740000000, 10.4732000000);
    path.lineTo(171.5010000000, 14.9762000000);
    path.close();
    path.moveTo(176.7340000000, 17.6619000000);
    path.cubicTo(177.0210000000, 17.8181000000, 177.3070000000, 17.9756000000,
        177.5920000000, 18.1342000000);
    path.lineTo(180.0210000000, 13.7634000000);
    path.cubicTo(179.7230000000, 13.5981000000, 179.4250000000, 13.4340000000,
        179.1260000000, 13.2712000000);
    path.lineTo(176.7340000000, 17.6619000000);
    path.close();
    path.moveTo(181.8220000000, 20.6006000000);
    path.cubicTo(182.1000000000, 20.7711000000, 182.3780000000, 20.9427000000,
        182.6560000000, 21.1155000000);
    path.lineTo(185.3000000000, 16.8723000000);
    path.cubicTo(185.0110000000, 16.6921000000, 184.7210000000, 16.5130000000,
        184.4310000000, 16.3352000000);
    path.lineTo(181.8220000000, 20.6006000000);
    path.close();
    path.moveTo(186.7550000000, 23.7935000000);
    path.cubicTo(187.0240000000, 23.9778000000, 187.2930000000, 24.1632000000,
        187.5600000000, 24.3498000000);
    path.lineTo(190.4190000000, 20.2479000000);
    path.cubicTo(190.1400000000, 20.0531000000, 189.8600000000, 19.8595000000,
        189.5790000000, 19.6671000000);
    path.lineTo(186.7550000000, 23.7935000000);
    path.close();
    path.moveTo(191.5120000000, 27.2340000000);
    path.cubicTo(191.7710000000, 27.4320000000, 192.0300000000, 27.6311000000,
        192.2870000000, 27.8313000000);
    path.lineTo(195.3570000000, 23.8848000000);
    path.cubicTo(195.0880000000, 23.6756000000, 194.8180000000, 23.4675000000,
        194.5470000000, 23.2606000000);
    path.lineTo(191.5120000000, 27.2340000000);
    path.close();
    path.moveTo(196.0800000000, 30.9197000000);
    path.cubicTo(196.3290000000, 31.1312000000, 196.5760000000, 31.3438000000,
        196.8220000000, 31.5576000000);
    path.lineTo(200.0990000000, 27.7811000000);
    path.cubicTo(199.8410000000, 27.5575000000, 199.5830000000, 27.3350000000,
        199.3230000000, 27.1138000000);
    path.lineTo(196.0800000000, 30.9197000000);
    path.close();
    path.moveTo(200.4390000000, 34.8426000000);
    path.cubicTo(200.6750000000, 35.0670000000, 200.9100000000, 35.2925000000,
        201.1450000000, 35.5192000000);
    path.lineTo(204.6230000000, 31.9271000000);
    path.cubicTo(204.3780000000, 31.6898000000, 204.1310000000, 31.4537000000,
        203.8840000000, 31.2187000000);
    path.lineTo(200.4390000000, 34.8426000000);
    path.close();
    path.moveTo(204.5780000000, 39.0013000000);
    path.cubicTo(204.8010000000, 39.2385000000, 205.0240000000, 39.4768000000,
        205.2450000000, 39.7161000000);
    path.lineTo(208.9180000000, 36.3233000000);
    path.cubicTo(208.6860000000, 36.0725000000, 208.4530000000, 35.8228000000,
        208.2190000000, 35.5742000000);
    path.lineTo(204.5780000000, 39.0013000000);
    path.close();
    path.moveTo(208.4690000000, 43.3753000000);
    path.cubicTo(208.6790000000, 43.6246000000, 208.8870000000, 43.8750000000,
        209.0940000000, 44.1265000000);
    path.lineTo(212.9530000000, 40.9466000000);
    path.cubicTo(212.7360000000, 40.6829000000, 212.5170000000, 40.4204000000,
        212.2980000000, 40.1589000000);
    path.lineTo(208.4690000000, 43.3753000000);
    path.close();
    path.moveTo(212.1120000000, 47.9720000000);
    path.cubicTo(212.3060000000, 48.2316000000, 212.4990000000, 48.4923000000,
        212.6900000000, 48.7539000000);
    path.lineTo(216.7250000000, 45.8007000000);
    path.cubicTo(216.5240000000, 45.5261000000, 216.3220000000, 45.2526000000,
        216.1180000000, 44.9802000000);
    path.lineTo(212.1120000000, 47.9720000000);
    path.close();
    path.moveTo(215.4750000000, 52.7573000000);
    path.cubicTo(215.6550000000, 53.0294000000, 215.8330000000, 53.3025000000,
        216.0110000000, 53.5766000000);
    path.lineTo(220.2100000000, 50.8619000000);
    path.cubicTo(220.0240000000, 50.5742000000, 219.8360000000, 50.2875000000,
        219.6480000000, 50.0020000000);
    path.lineTo(215.4750000000, 52.7573000000);
    path.close();
    path.moveTo(218.5590000000, 57.7369000000);
    path.cubicTo(218.7220000000, 58.0170000000, 218.8830000000, 58.2982000000,
        219.0430000000, 58.5803000000);
    path.lineTo(223.3930000000, 56.1148000000);
    path.cubicTo(223.2250000000, 55.8186000000, 223.0560000000, 55.5234000000,
        222.8850000000, 55.2293000000);
    path.lineTo(218.5590000000, 57.7369000000);
    path.close();
    path.moveTo(221.3470000000, 62.8867000000);
    path.cubicTo(221.4940000000, 63.1788000000, 221.6400000000, 63.4718000000,
        221.7850000000, 63.7658000000);
    path.lineTo(226.2710000000, 61.5588000000);
    path.cubicTo(226.1200000000, 61.2501000000, 225.9660000000, 60.9425000000,
        225.8120000000, 60.6359000000);
    path.lineTo(221.3470000000, 62.8867000000);
    path.close();
    path.moveTo(223.8260000000, 68.1821000000);
    path.cubicTo(223.9550000000, 68.4795000000, 224.0830000000, 68.7778000000,
        224.2090000000, 69.0770000000);
    path.lineTo(228.8160000000, 67.1336000000);
    path.cubicTo(228.6830000000, 66.8196000000, 228.5490000000, 66.5065000000,
        228.4140000000, 66.1944000000);
    path.lineTo(223.8260000000, 68.1821000000);
    path.close();
    path.moveTo(226.0040000000, 73.6362000000);
    path.cubicTo(226.1170000000, 73.9449000000, 226.2280000000, 74.2544000000,
        226.3390000000, 74.5649000000);
    path.lineTo(231.0500000000, 72.8914000000);
    path.cubicTo(230.9340000000, 72.5657000000, 230.8170000000, 72.2410000000,
        230.6990000000, 71.9173000000);
    path.lineTo(226.0040000000, 73.6362000000);
    path.close();
    path.moveTo(227.8530000000, 79.1702000000);
    path.cubicTo(227.9470000000, 79.4810000000, 228.0400000000, 79.7926000000,
        228.1320000000, 80.1051000000);
    path.lineTo(232.9300000000, 78.6999000000);
    path.cubicTo(232.8340000000, 78.3724000000, 232.7370000000, 78.0458000000,
        232.6380000000, 77.7201000000);
    path.lineTo(227.8530000000, 79.1702000000);
    path.close();
    path.moveTo(229.4030000000, 84.8589000000);
    path.cubicTo(229.4800000000, 85.1763000000, 229.5560000000, 85.4946000000,
        229.6300000000, 85.8137000000);
    path.lineTo(234.5000000000, 84.6793000000);
    path.cubicTo(234.4220000000, 84.3452000000, 234.3430000000, 84.0120000000,
        234.2620000000, 83.6796000000);
    path.lineTo(229.4030000000, 84.8589000000);
    path.close();
    path.moveTo(230.6220000000, 90.5525000000);
    path.cubicTo(230.6820000000, 90.8725000000, 230.7400000000, 91.1933000000,
        230.7970000000, 91.5149000000);
    path.lineTo(235.7210000000, 90.6440000000);
    path.cubicTo(235.6610000000, 90.3077000000, 235.6000000000, 89.9723000000,
        235.5380000000, 89.6377000000);
    path.lineTo(230.6220000000, 90.5525000000);
    path.close();
    path.moveTo(231.5490000000, 96.3999000000);
    path.cubicTo(231.5910000000, 96.7203000000, 231.6320000000, 97.0415000000,
        231.6720000000, 97.3635000000);
    path.lineTo(236.6340000000, 96.7546000000);
    path.cubicTo(236.5930000000, 96.4184000000, 236.5510000000, 96.0830000000,
        236.5070000000, 95.7484000000);
    path.lineTo(231.5490000000, 96.3999000000);
    path.close();
    path.moveTo(232.1600000000, 102.1820000000);
    path.cubicTo(232.1860000000, 102.5070000000, 232.2110000000, 102.8330000000,
        232.2340000000, 103.1590000000);
    path.lineTo(237.2210000000, 102.8010000000);
    path.cubicTo(237.1970000000, 102.4610000000, 237.1710000000, 102.1210000000,
        237.1440000000, 101.7820000000);
    path.lineTo(232.1600000000, 102.1820000000);
    path.close();
    path.moveTo(232.4870000000, 108.1110000000);
    path.cubicTo(232.4920000000, 108.2780000000, 232.4960000000, 108.4450000000,
        232.5010000000, 108.6120000000);
    path.lineTo(237.4990000000, 108.4800000000);
    path.cubicTo(237.4950000000, 108.3060000000, 237.4900000000, 108.1320000000,
        237.4840000000, 107.9590000000);
    path.lineTo(232.4870000000, 108.1110000000);
    path.close();
    return path;
  }

  static Path _build_11() {
    var path = Path();
    path.moveTo(210.0000000000, 100.0000000000);
    path.cubicTo(210.0000000000, 86.8678000000, 207.2840000000, 73.8642000000,
        202.0070000000, 61.7317000000);
    path.cubicTo(196.7310000000, 49.5991000000, 188.9960000000, 38.5752000000,
        179.2460000000, 29.2893000000);
    path.cubicTo(169.4960000000, 20.0035000000, 157.9210000000, 12.6375000000,
        145.1820000000, 7.6120500000);
    path.cubicTo(132.4430000000, 2.5865800000, 118.7890000000, -0.0000005740,
        105.0000000000, 0.0000000000);
    path.cubicTo(91.2112000000, 0.0000005740, 77.5574000000, 2.5865800000,
        64.8182000000, 7.6120500000);
    path.cubicTo(52.0790000000, 12.6375000000, 40.5039000000, 20.0035000000,
        30.7538000000, 29.2893000000);
    path.cubicTo(21.0036000000, 38.5752000000, 13.2694000000, 49.5991000000,
        7.9926500000, 61.7317000000);
    path.cubicTo(2.7159000000, 73.8642000000, -0.0000012054, 86.8678000000,
        0.0000000000, 100.0000000000);
    path.lineTo(105.0000000000, 100.0000000000);
    path.lineTo(210.0000000000, 100.0000000000);
    path.close();
    return path;
  }
}

class _PaintCatalog {
  _PaintCatalog() {
    this.paint_0 = (Paint()..color = _ColorCatalog.instance.color_2);
    this.paint_1 = (Paint()..color = _ColorCatalog.instance.color_3);
    this.paint_2 = (Paint()..color = _ColorCatalog.instance.color_4);
    this.paint_3 = (Paint()..color = _ColorCatalog.instance.color_5);
    this.paint_4 = (Paint()..color = _ColorCatalog.instance.color_6);
    this.paint_5 = (Paint()..color = _ColorCatalog.instance.color_9);
    this.paint_6 = (Paint()..color = _ColorCatalog.instance.color_11);
    this.paint_7 = (Paint()..color = _ColorCatalog.instance.color_13);
    this.paint_8 = (Paint()..color = _ColorCatalog.instance.color_14);
    this.paint_9 = (Paint()..color = _ColorCatalog.instance.color_15);
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  Paint paint_3;

  Paint paint_4;

  Paint paint_5;

  Paint paint_6;

  Paint paint_7;

  Paint paint_8;

  Paint paint_9;

  static final _PaintCatalog instance = _PaintCatalog();
}

class _EffectCatalog {
  _EffectCatalog() {
    this.paint_0 = (Paint()
      ..color = _ColorCatalog.instance.color_1
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, Shadow.convertRadiusToSigma(4)));
    this.paint_1 = (Paint()
      ..color = _ColorCatalog.instance.color_8
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, Shadow.convertRadiusToSigma(4)));
    this.paint_2 = (Paint()
      ..color = _ColorCatalog.instance.color_10
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, Shadow.convertRadiusToSigma(4)));
    this.paint_3 = (Paint()
      ..color = _ColorCatalog.instance.color_12
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, Shadow.convertRadiusToSigma(4)));
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  Paint paint_3;

  static final _EffectCatalog instance = _EffectCatalog();
}

class _ColorCatalog {
  _ColorCatalog() {
    this.color_0 = Color.fromARGB(0, 0, 0, 0);
    this.color_1 = Color.fromARGB(63, 0, 255, 107);
    this.color_2 = Color.fromARGB(127, 39, 174, 96);
    this.color_3 = Color.fromARGB(255, 36, 50, 63);
    this.color_4 = Color.fromARGB(255, 111, 207, 151);
    this.color_5 = Color.fromARGB(76, 32, 150, 83);
    this.color_6 = Color.fromARGB(255, 16, 170, 120);
    this.color_7 = Color.fromARGB(255, 242, 242, 242);
    this.color_8 = Color.fromARGB(63, 255, 0, 0);
    this.color_9 = Color.fromARGB(127, 255, 0, 0);
    this.color_10 = Color.fromARGB(63, 255, 168, 0);
    this.color_11 = Color.fromARGB(127, 255, 168, 0);
    this.color_12 = Color.fromARGB(127, 111, 207, 151);
    this.color_13 = Color.fromARGB(255, 35, 49, 62);
    this.color_14 = Color.fromARGB(127, 16, 170, 120);
    this.color_15 = Color.fromARGB(63, 255, 255, 255);
    this.color_16 = Color.fromARGB(255, 0, 255, 107);
    this.color_17 = Color.fromARGB(115, 0, 255, 107);
    this.color_18 = Color.fromARGB(0, 0, 255, 107);
  }

  Color color_0;

  Color color_1;

  Color color_2;

  Color color_3;

  Color color_4;

  Color color_5;

  Color color_6;

  Color color_7;

  Color color_8;

  Color color_9;

  Color color_10;

  Color color_11;

  Color color_12;

  Color color_13;

  Color color_14;

  Color color_15;

  Color color_16;

  Color color_17;

  Color color_18;

  static final _ColorCatalog instance = _ColorCatalog();
}

class _TextStyleCatalog {
  _TextStyleCatalog() {
    this.ui_TextStyle_0 = ui.TextStyle(
      fontFamily: 'Jura',
      color: _ColorCatalog.instance.color_7,
      fontSize: 14.0000000000,
      fontWeight: FontWeight.w400,
    );
  }

  ui.TextStyle ui_TextStyle_0;

  static final _TextStyleCatalog instance = _TextStyleCatalog();
}

class Data {
  Data({this.isVisible});

  final bool isVisible;

  @override
  bool operator ==(o) => o is Data && isVisible == o.isVisible;
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    return result;
  }
}

class TextData extends Data {
  TextData({isVisible, this.text}) : super(isVisible: isVisible);

  final String text;

  @override
  bool operator ==(o) =>
      o is TextData && isVisible == o.isVisible && text == o.text;
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    result = 37 * result + (this.text?.hashCode ?? 0);
    return result;
  }
}

class VectorData extends Data {
  VectorData({isVisible}) : super(isVisible: isVisible);

  @override
  bool operator ==(o) => o is VectorData && isVisible == o.isVisible;
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    return result;
  }
}
