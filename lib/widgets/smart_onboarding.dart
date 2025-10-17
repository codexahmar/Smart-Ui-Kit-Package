import 'package:flutter/material.dart';

enum IndicatorPosition { bottom, top }

class SmartOnboardingPage {
  final Widget? image;
  final String? title;
  final String? description;
  final Widget? customContent;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;

  const SmartOnboardingPage({
    this.image,
    this.title,
    this.description,
    this.customContent,
    this.backgroundColor,
    this.contentPadding,
  });
}

typedef SmartOnboardingIndicatorBuilder =
    Widget Function(BuildContext context, int pageCount, int currentPage);
typedef SmartOnboardingButtonBuilder =
    Widget Function(
      BuildContext context,
      VoidCallback? onPressed,
      bool isLastPage,
    );
typedef SmartOnboardingPageBuilder =
    Widget Function(
      BuildContext context,
      SmartOnboardingPage page,
      int index,
      bool isActive,
    );

class SmartOnboarding extends StatefulWidget {
  final List<SmartOnboardingPage> pages;
  final VoidCallback? onDone;
  final VoidCallback? onSkip;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final bool showSkipButton;
  final bool showBackButton;
  final bool showNextButton;
  final bool showDoneButton;
  final String skipText;
  final String backText;
  final String nextText;
  final String doneText;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final PageController? controller;
  final EdgeInsets pagePadding;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final SmartOnboardingIndicatorBuilder? indicatorBuilder;
  final SmartOnboardingButtonBuilder? skipButtonBuilder;
  final SmartOnboardingButtonBuilder? backButtonBuilder;
  final SmartOnboardingButtonBuilder? nextButtonBuilder;
  final SmartOnboardingButtonBuilder? doneButtonBuilder;
  final SmartOnboardingPageBuilder? pageBuilder;
  final bool imageFullScreen;
  final double indicatorSpacing;
  final double indicatorSize;
  final double activeIndicatorWidth;
  final bool showIndicator;
  final IndicatorPosition indicatorPosition;
  final bool swipeEnabled;
  final ValueChanged<int>? onPageChanged;

  const SmartOnboarding({
    super.key,
    required this.pages,
    this.onDone,
    this.onSkip,
    this.indicatorActiveColor = Colors.blue,
    this.indicatorInactiveColor = Colors.grey,
    this.showSkipButton = true,
    this.showBackButton = true,
    this.showNextButton = true,
    this.showDoneButton = true,
    this.skipText = "Skip",
    this.backText = "Back",
    this.nextText = "Next",
    this.doneText = "Done",
    this.titleStyle,
    this.descriptionStyle,
    this.controller,
    this.pagePadding = const EdgeInsets.all(24),
    this.transitionDuration = const Duration(milliseconds: 300),
    this.transitionCurve = Curves.easeInOut,
    this.indicatorBuilder,
    this.skipButtonBuilder,
    this.backButtonBuilder,
    this.nextButtonBuilder,
    this.doneButtonBuilder,
    this.pageBuilder,
    this.imageFullScreen = false,
    this.indicatorSpacing = 4.0,
    this.indicatorSize = 8.0,
    this.activeIndicatorWidth = 24.0,
    this.showIndicator = true,
    this.indicatorPosition = IndicatorPosition.bottom,
    this.swipeEnabled = true,
    this.onPageChanged,
  });

  @override
  State<SmartOnboarding> createState() => _SmartOnboardingState();
}

class _SmartOnboardingState extends State<SmartOnboarding> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller ?? PageController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _pageController.dispose();
    }
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < widget.pages.length - 1) {
      _pageController.nextPage(
        duration: widget.transitionDuration,
        curve: widget.transitionCurve,
      );
    } else {
      widget.onDone?.call();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: widget.transitionDuration,
        curve: widget.transitionCurve,
      );
    }
  }

  void _skip() {
    widget.onSkip?.call();
  }

  Widget _defaultIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pages.length, (index) {
        bool isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: widget.indicatorSpacing),
          height: widget.indicatorSize,
          width: isActive ? widget.activeIndicatorWidth : widget.indicatorSize,
          decoration: BoxDecoration(
            color: isActive
                ? widget.indicatorActiveColor
                : widget.indicatorInactiveColor,
            borderRadius: BorderRadius.circular(widget.indicatorSize / 2),
          ),
        );
      }),
    );
  }

  Widget _defaultPageBuilder(
    BuildContext context,
    SmartOnboardingPage page,
    int index,
    bool isActive,
  ) {
    // If customContent is provided, use it and ensure it takes full screen
    if (page.customContent != null) {
      return Container(
        color:
            page.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: page.customContent,
      );
    }

    // Fallback to default content if no customContent is provided
    return Container(
      color: page.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      padding: page.contentPadding ?? widget.pagePadding,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (page.image != null)
            widget.imageFullScreen ? Expanded(child: page.image!) : page.image!,
          if (page.title != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                page.title!,
                style:
                    widget.titleStyle ??
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          if (page.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                page.description!,
                style:
                    widget.descriptionStyle ??
                    Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required bool visible,
    required SmartOnboardingButtonBuilder? customBuilder,
    required VoidCallback? onPressed,
    required String defaultText,
    required bool isLastPage,
  }) {
    if (!visible) return const SizedBox.shrink();
    if (customBuilder != null) {
      return customBuilder(context, onPressed, isLastPage);
    }
    return TextButton(onPressed: onPressed, child: Text(defaultText));
  }

  @override
  Widget build(BuildContext context) {
    final indicator = widget.showIndicator
        ? widget.indicatorBuilder?.call(
                context,
                widget.pages.length,
                _currentPage,
              ) ??
              _defaultIndicators()
        : const SizedBox.shrink();

    final isLastPage = _currentPage == widget.pages.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.pages.length,
            physics: widget.swipeEnabled
                ? null
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentPage = index);
              widget.onPageChanged?.call(index);
            },
            itemBuilder: (context, index) {
              final page = widget.pages[index];
              return widget.pageBuilder?.call(
                    context,
                    page,
                    index,
                    index == _currentPage,
                  ) ??
                  _defaultPageBuilder(
                    context,
                    page,
                    index,
                    index == _currentPage,
                  );
            },
          ),
          if (widget.showSkipButton && !isLastPage)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              right: 16,
              child: _buildButton(
                visible: widget.showSkipButton && !isLastPage,
                customBuilder: widget.skipButtonBuilder,
                onPressed: _skip,
                defaultText: widget.skipText,
                isLastPage: false,
              ),
            ),
          if (widget.showIndicator &&
              widget.indicatorPosition == IndicatorPosition.top)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 0,
              right: 0,
              child: Center(child: indicator),
            ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                children: [
                  if (widget.showIndicator &&
                      widget.indicatorPosition == IndicatorPosition.bottom)
                    indicator,
                  if (widget.showIndicator &&
                      widget.indicatorPosition == IndicatorPosition.bottom)
                    const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton(
                        visible: widget.showBackButton && _currentPage > 0,
                        customBuilder: widget.backButtonBuilder,
                        onPressed: _previousPage,
                        defaultText: widget.backText,
                        isLastPage: false,
                      ),
                      _buildButton(
                        visible:
                            (widget.showNextButton && !isLastPage) ||
                            (widget.showDoneButton && isLastPage),
                        customBuilder: isLastPage
                            ? widget.doneButtonBuilder
                            : widget.nextButtonBuilder,
                        onPressed: isLastPage ? widget.onDone : _nextPage,
                        defaultText: isLastPage
                            ? widget.doneText
                            : widget.nextText,
                        isLastPage: isLastPage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
