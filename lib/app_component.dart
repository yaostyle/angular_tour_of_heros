import 'package:angular/angular.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';
import 'dart:async';

import 'src/hero.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selected;

  AppComponent(this._heroService);

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes();
  void onSelect(Hero hero) => selected = hero;
  void clearAll() => selected = null;
}
