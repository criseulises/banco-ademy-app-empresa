/// Dimensional constants for spacing, sizing, and layout
/// 
/// Provides consistent spacing and sizing throughout the application
class AppDimensions {
  AppDimensions._();

  // ============================================================================
  // SPACING (Padding & Margin)
  // ============================================================================

  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;

  // Common spacing shortcuts
  static const double spacingXs = spacing4;
  static const double spacingSm = spacing8;
  static const double spacingMd = spacing16;
  static const double spacingLg = spacing24;
  static const double spacingXl = spacing32;
  static const double spacingXxl = spacing48;

  // ============================================================================
  // BORDER RADIUS
  // ============================================================================

  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusRound = 999.0;

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;
  static const double iconXxl = 64.0;

  // ============================================================================
  // BUTTON SIZES
  // ============================================================================

  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  static const double buttonMinWidth = 64.0;
  static const double buttonBorderRadius = radiusMd;

  // ============================================================================
  // INPUT FIELD SIZES
  // ============================================================================

  static const double inputHeight = 56.0;
  static const double inputHeightSmall = 40.0;
  static const double inputBorderRadius = radiusMd;
  static const double inputBorderWidth = 1.5;

  // ============================================================================
  // CARD SIZES
  // ============================================================================

  static const double cardElevation = 2.0;
  static const double cardBorderRadius = radiusLg;
  static const double cardPadding = spacing16;

  // Banking card dimensions (credit/debit card)
  static const double bankingCardWidth = 340.0;
  static const double bankingCardHeight = 215.0;
  static const double bankingCardRadius = radiusLg;

  // ============================================================================
  // APP BAR
  // ============================================================================

  static const double appBarHeight = 56.0;
  static const double appBarElevation = 0.0;

  // ============================================================================
  // BOTTOM NAVIGATION BAR
  // ============================================================================

  static const double bottomNavHeight = 72.0;
  static const double bottomNavIconSize = iconMd;

  // ============================================================================
  // DIVIDER
  // ============================================================================

  static const double dividerThickness = 1.0;
  static const double dividerIndent = spacing16;

  // ============================================================================
  // AVATAR SIZES
  // ============================================================================

  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 48.0;
  static const double avatarLg = 64.0;
  static const double avatarXl = 96.0;

  // ============================================================================
  // IMAGE SIZES
  // ============================================================================

  static const double imageThumbSize = 64.0;
  static const double imageSmallSize = 120.0;
  static const double imageMediumSize = 200.0;
  static const double imageLargeSize = 300.0;

  // ============================================================================
  // DIALOG & MODAL
  // ============================================================================

  static const double dialogBorderRadius = radiusLg;
  static const double dialogPadding = spacing24;
  static const double dialogMaxWidth = 400.0;

  static const double bottomSheetBorderRadius = radiusXl;
  static const double bottomSheetHandleWidth = 32.0;
  static const double bottomSheetHandleHeight = 4.0;

  // ============================================================================
  // LOADING INDICATORS
  // ============================================================================

  static const double loadingIndicatorSizeSmall = 20.0;
  static const double loadingIndicatorSizeMedium = 40.0;
  static const double loadingIndicatorSizeLarge = 60.0;

  // ============================================================================
  // LIST TILES
  // ============================================================================

  static const double listTileHeight = 72.0;
  static const double listTilePadding = spacing16;
  static const double listTileIconSize = iconMd;

  // ============================================================================
  // SCREEN PADDING
  // ============================================================================

  static const double screenPaddingHorizontal = spacing16;
  static const double screenPaddingVertical = spacing16;
  static const double screenPaddingTop = spacing24;
  static const double screenPaddingBottom = spacing24;

  // ============================================================================
  // MAX WIDTHS (for responsive design)
  // ============================================================================

  static const double maxContentWidth = 600.0;
  static const double maxDialogWidth = 400.0;
  static const double maxFormWidth = 500.0;

  // ============================================================================
  // ELEVATION LEVELS
  // ============================================================================

  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 2.0;
  static const double elevation3 = 3.0;
  static const double elevation4 = 4.0;
  static const double elevation6 = 6.0;
  static const double elevation8 = 8.0;
  static const double elevation12 = 12.0;
  static const double elevation16 = 16.0;
  static const double elevation24 = 24.0;

  // ============================================================================
  // ANIMATION DURATIONS (in milliseconds)
  // ============================================================================

  static const int animationShort = 200;
  static const int animationMedium = 300;
  static const int animationLong = 500;

  // ============================================================================
  // BORDER WIDTH
  // ============================================================================

  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 1.5;
  static const double borderWidthThick = 2.0;
}
