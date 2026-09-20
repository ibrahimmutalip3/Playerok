import 'package:flutter/material.dart';
import '../models/game_category.dart';
import '../models/product_category.dart';
import '../models/listing.dart';
import '../models/chat_preview.dart';
import '../models/chat_message.dart';

class MockData {
  MockData._();

  static const List<GameCategory> games = [
    GameCategory(
      title: 'Steam',
      accentColor: Color(0xFF2B323A),
      icon: Icons.cloud_rounded,
    ),
    GameCategory(
      title: 'Roblox',
      accentColor: Color(0xFFE5484D),
      icon: Icons.videogame_asset_rounded,
    ),
    GameCategory(
      title: 'Genshin Impact',
      accentColor: Color(0xFF4C8DFF),
      icon: Icons.auto_awesome_rounded,
    ),
    GameCategory(
      title: 'Brawl Stars',
      accentColor: Color(0xFFFFC72C),
      icon: Icons.celebration_rounded,
    ),
    GameCategory(
      title: 'Standoff 2',
      accentColor: Color(0xFF5C6B73),
      icon: Icons.adjust_rounded,
    ),
    GameCategory(
      title: 'Minecraft',
      accentColor: Color(0xFF6E8B3D),
      icon: Icons.grid_view_rounded,
      isNew: true,
    ),
    GameCategory(
      title: 'Dota 2',
      accentColor: Color(0xFFD9432E),
      icon: Icons.shield_rounded,
    ),
    GameCategory(
      title: 'Counter-Strike 2',
      accentColor: Color(0xFFF5A524),
      icon: Icons.gps_fixed_rounded,
    ),
    GameCategory(
      title: 'World of Tanks',
      accentColor: Color(0xFF7A8A4A),
      icon: Icons.military_tech_rounded,
    ),
    GameCategory(
      title: 'EA Sports FC',
      accentColor: Color(0xFF31B057),
      icon: Icons.sports_soccer_rounded,
    ),
    GameCategory(
      title: 'PUBG Mobile',
      accentColor: Color(0xFFEA9B3C),
      icon: Icons.terrain_rounded,
    ),
    GameCategory(
      title: 'GTA 5 Online',
      accentColor: Color(0xFF8B5CF6),
      icon: Icons.directions_car_filled_rounded,
    ),
  ];

  static const List<ProductCategory> productCategories = [
    ProductCategory(title: 'Аккаунты', icon: Icons.person_rounded),
    ProductCategory(title: 'Донат и валюта', icon: Icons.paid_rounded),
    ProductCategory(title: 'Пополнение', icon: Icons.add_card_rounded),
    ProductCategory(title: 'Скины', icon: Icons.palette_rounded),
    ProductCategory(title: 'Ключи', icon: Icons.vpn_key_rounded),
    ProductCategory(title: 'Буст', icon: Icons.trending_up_rounded),
    ProductCategory(title: 'Предметы', icon: Icons.inventory_2_rounded),
    ProductCategory(title: 'Услуги', icon: Icons.handyman_rounded),
  ];

  static const List<String> platformShortcuts = [
    'Steam',
    'PlayStation',
    'Xbox',
    'Nintendo',
    'EA Play',
    'Epic Games',
    'Telegram',
    'Discord',
  ];

  static const List<Listing> listings = [
    Listing(
      title: 'Пополнение кошелька Steam',
      subtitle: 'Быстрая выдача, любой регион',
      price: 375,
      gameTag: 'Steam',
      sellerName: 'Playerok',
      sellerRating: 5.0,
      sellerDeals: 24500,
      isVerifiedSeller: true,
      isOfficial: true,
    ),
    Listing(
      title: '965 CP на ваш аккаунт, РУ регион',
      subtitle: 'Даже с закрытым магазином',
      price: 899,
      gameTag: 'Call of Duty',
      sellerName: 'CPShop',
      sellerRating: 4.9,
      sellerDeals: 812,
      isVerifiedSeller: true,
      isPromoted: true,
    ),
    Listing(
      title: 'GTA V Social Club с почтой',
      subtitle: 'Доступ в Online и RP, гарантия 100%',
      price: 375,
      gameTag: 'GTA 5 Online',
      sellerName: 'GameKeys',
      sellerRating: 4.8,
      sellerDeals: 2140,
    ),
    Listing(
      title: 'Сумеречный пропуск по user ID',
      subtitle: 'Без входа на аккаунт',
      price: 1590,
      gameTag: 'Genshin Impact',
      sellerName: 'GenshinShop',
      sellerRating: 5.0,
      sellerDeals: 356,
      isVerifiedSeller: true,
    ),
    Listing(
      title: 'EA Play на 1 месяц',
      subtitle: 'Быстрая выдача',
      price: 420,
      gameTag: 'EA Sports FC',
      sellerName: 'Playerok',
      sellerRating: 5.0,
      sellerDeals: 9800,
      isVerifiedSeller: true,
      isOfficial: true,
    ),
    Listing(
      title: 'Голда Standoff 2 на аккаунт',
      subtitle: 'Моментальная доставка',
      price: 250,
      gameTag: 'Standoff 2',
      sellerName: 'GoldMarket',
      sellerRating: 4.7,
      sellerDeals: 1290,
      isPromoted: true,
    ),
  ];

  static const List<ChatPreview> chats = [
    ChatPreview(
      id: 'support',
      name: 'Служба поддержки Playerok',
      lastMessage: 'Здравствуйте! Опишите проблему, и мы поможем как можно скорее.',
      time: '12:04',
      kind: ChatKind.support,
      avatarLabel: 'PS',
      isOnline: true,
      isPinned: true,
    ),
    ChatPreview(
      id: 'playerok',
      name: 'Playerok',
      lastMessage: 'Ваш аккаунт успешно прошел проверку безопасности',
      time: 'Вчера',
      kind: ChatKind.system,
      avatarLabel: 'PK',
      isPinned: true,
    ),
    ChatPreview(
      id: 'deal_1',
      name: 'DarkTrader',
      lastMessage: 'Отправил данные от аккаунта, проверяйте',
      time: '09:41',
      kind: ChatKind.deal,
      avatarLabel: 'DT',
      unreadCount: 2,
      isOnline: true,
    ),
    ChatPreview(
      id: 'deal_2',
      name: 'RBX_Market',
      lastMessage: 'Спасибо за покупку, обращайтесь еще',
      time: 'Вторник',
      kind: ChatKind.deal,
      avatarLabel: 'RM',
    ),
    ChatPreview(
      id: 'deal_3',
      name: 'BoostPro',
      lastMessage: 'Вы: Когда сможете начать буст?',
      time: 'Понедельник',
      kind: ChatKind.deal,
      avatarLabel: 'BP',
    ),
    ChatPreview(
      id: 'deal_4',
      name: 'CraftKeys',
      lastMessage: 'Ключ активирован, приятной игры',
      time: '3 окт',
      kind: ChatKind.deal,
      avatarLabel: 'CK',
    ),
  ];

  static const List<ChatMessage> supportMessages = [
    ChatMessage(
      text: 'Здравствуйте! Вы обратились в службу поддержки Playerok.',
      time: '12:01',
      sender: MessageSender.them,
    ),
    ChatMessage(
      text: 'Опишите вашу проблему как можно подробнее, и мы поможем как можно скорее.',
      time: '12:01',
      sender: MessageSender.them,
    ),
    ChatMessage(
      text: 'Здравствуйте, не могу подтвердить сделку по заказу',
      time: '12:03',
      sender: MessageSender.me,
    ),
    ChatMessage(
      text: 'Подскажите номер заказа, и я проверю его статус',
      time: '12:04',
      sender: MessageSender.them,
    ),
  ];

  static const List<ChatMessage> playerokMessages = [
    ChatMessage(
      text: 'Добро пожаловать на Playerok! Это официальные уведомления платформы.',
      time: 'Вчера',
      sender: MessageSender.system,
    ),
    ChatMessage(
      text: 'Ваш аккаунт успешно прошел проверку безопасности',
      time: 'Вчера',
      sender: MessageSender.system,
    ),
  ];

  static const List<ChatMessage> dealMessages = [
    ChatMessage(
      text: 'Добрый день! Оплатил заказ, жду данные от аккаунта',
      time: '09:32',
      sender: MessageSender.me,
    ),
    ChatMessage(
      text: 'Здравствуйте, секунду, подготовлю данные',
      time: '09:35',
      sender: MessageSender.them,
    ),
    ChatMessage(
      text: 'Отправил данные от аккаунта, проверяйте',
      time: '09:41',
      sender: MessageSender.them,
    ),
  ];
}
