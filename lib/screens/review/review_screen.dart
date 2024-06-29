import 'package:flutter/material.dart';
import 'package:kidgo/commom/icon.dart';
import 'package:kidgo/components/cus_button.dart';
import 'package:kidgo/components/cus_text.dart';
import 'package:kidgo/main.dart';
import 'package:kidgo/models/review_model.dart';
import 'package:kidgo/my_app/route/screens.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  final PageController _controller = PageController(initialPage: 0);
  List<ReviewModel> get _listReview => [
        ReviewModel({
          'IMAGE': MyIcons.bus,
          'TITLE': 'Đặt xe',
          'CONTENT':
              'Bạn đang tìm kiếm một phương tiện di chuyển nhanh chóng, tiện lợi và tiết kiệm để đưa con đến trường? Đặt xe qua ứng dụng KidGo chính là giải pháp hoàn hảo dành cho bạn!',
        }),
        ReviewModel({
          'IMAGE': MyIcons.pig,
          'TITLE': 'Giá cả hợp lý',
          'CONTENT':
              'Bạn có thể dễ dàng so sánh giá cả của các hãng xe khác nhau trước khi đặt xe. Thanh toán dễ dàng: Bạn có thể thanh toán bằng tiền mặt hoặc ví điện tử một cách nhanh chóng và tiện lợi.',
        }),
        ReviewModel({
          'IMAGE': MyIcons.phone,
          'TITLE': 'Tiện ích',
          'CONTENT':
              'Chỉ với vài thao tác đơn giản trên điện thoại thông minh, bạn có thể dễ dàng đặt xe mọi lúc mọi nơi, không cần tốn thời gian. An toàn: Các ứng dụng đặt xe uy tín đều có quy trình tuyển chọn và quản lý tài xế chặt chẽ, đảm bảo an toàn cho con bạn.',
        })
      ];

  void _next(int i) {
    _controller.animateToPage(
      i,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _controller.animateToPage(
      _listReview.length - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _listReview.length,
              itemBuilder: (_, i) {
                return _slider(_listReview[i]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Indicator(
              itemCount: _listReview.length,
              next: _next,
              skip: _skip,
            ),
          ),
        ],
      ),
    );
  }

  Widget _slider(ReviewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(model.image),
          CusText.titleMedium(model.title),
          CusText.bodyMedium(
            model.content,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatefulWidget {
  const Indicator({
    super.key,
    required this.itemCount,
    required this.next,
    required this.skip,
  });

  final int itemCount;
  final void Function(int) next;
  final void Function() skip;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  int get _itemCount => widget.itemCount;
  int _itemSelect = 0;
  int get itemSelect => _itemSelect;

  bool get _isStart => _itemCount == _itemSelect + 1;
  void _next() {
    setState(() {
      _itemSelect = itemSelect + 1;
    });
    widget.next.call(_itemSelect);
  }

  void _skip() {
    setState(() {
      _itemSelect = _itemCount - 1;
    });
    widget.skip.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: _isStart ? _startBtn() : null,
        ),
        SizedBox(
          height: 42,
          child: Row(
            children: [
              if (!_isStart) ...[_skipBtn()],
              const Spacer(),
              Row(
                children: List.generate(
                  _itemCount,
                  _indicator,
                  growable: false,
                ),
              ),
              const Spacer(),
              if (!_isStart) ...[_nextBtn()],
            ],
          ),
        ),
      ],
    );
  }

  Widget _indicator(int index) {
    bool isSelect = index == _itemSelect;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8,
      width: isSelect ? 32 : 8,
      decoration: BoxDecoration(
        color: isSelect ? const Color(0XFF328eae) : const Color(0XFFc4ebf8),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _skipBtn() {
    return CusButton.text(
      text: 'Bỏ qua',
      onPressed: _skip,
    );
  }

  Widget _nextBtn() {
    return CusButton.text(
      text: 'Tiếp theo',
      onPressed: _next,
    );
  }

  Widget _startBtn() {
    return CusButton.elevated(
      text: 'Bắt đầu',
      onPressed: () => MyApp.to(
        context,
        screen: Screens.login,
      ),
    );
  }
}
