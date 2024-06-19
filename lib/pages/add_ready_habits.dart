import 'package:flutter/material.dart';
import 'package:untitled/services/ready_habits.dart';

Scaffold ListReadyHabits(String lastTap){
  if (lastTap == 'Здоровье'){
    return Scaffold(
        appBar: AppBar(),
        body: Healt()
    );
  }
  if (lastTap == 'Физическая активность'){
    return Scaffold(
        appBar: AppBar(),
        body: Sport()
    );
  }
  if (lastTap == 'Питание'){
    return Scaffold(
        appBar: AppBar(),
        body: Eat()
    );
  }
  if (lastTap == 'Распорядок дня'){
    return Scaffold(
        appBar: AppBar(),
        body: Eat()
    );
  }
  else return Scaffold(body: Text('Выберите категорию'));
}

Padding Healt(){
  return Padding(
    padding: EdgeInsets.all(17),
    child: ListView(
      children: [
        ReadyHabits(
            name: 'Напоминание о приеме витаминов и лекарствe',
            about: 'Обеспечивает регулярный прием важных витаминов и лекарств для поддержания здоровья и профилактики заболеваний. Создайте расписание приема витаминов и лекарств, следите за их регулярностью',
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        ReadyHabits(
            name: 'Упражнения для глаз',
            about: 'Предотвращает усталость глаз, улучшает зрение и снижает напряжение. Выполняйте специальные упражнения для глаз несколько раз в день, особенно после длительного использования устройств.'
        )
      ],
    ),
  );
}

Padding Sport(){
  return Padding(
    padding: EdgeInsets.all(17),
    child: ListView(
      children: [
        ReadyHabits(
          name: 'Разминка при сидячем образе жизни',
          about: 'Улучшает кровообращение, снимает напряжение и повышает энергию. Выбирайте удобное время для разминки в течение дня, делайте короткие упражнения для растяжки и активации мышц.',
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        ReadyHabits(
            name: 'Отслеживание количества пройденных шагов',
            about: 'Поддерживает активность, улучшает физическую форму и общее самочувствие. Отслеживайте количество пройденных шагов в течение дня, ставьте цели и поощрения для поддержания активности.'
        )
      ],
    ),
  );
}

Padding Eat(){
  return Padding(
    padding: EdgeInsets.all(17),
    child: ListView(
      children: [
        ReadyHabits(
          name: 'Напоминание о регулярных приемах пищи',
          about: 'Поддерживает активность, улучшает физическую форму и общее самочувствие. Отслеживайте количество пройденных шагов в течение дня, ставьте цели и поощрения для поддержания активности.',
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        ReadyHabits(
            name: 'Напоминание о важности употребления фруктов и овощей',
            about: 'Обогащает организм витаминами, минералами и антиоксидантами, укрепляет иммунитет. Включайте фрукты и овощи в рацион ежедневно, создавая привычку к здоровому питанию.'
        )
      ],
    ),
  );
}

Padding Routine(){
  return Padding(
    padding: EdgeInsets.all(17),
    child: ListView(
      children: [
        ReadyHabits(
          name: 'Здоровый сон',
          about: 'Позволяет организму восстановиться после дневной активности и подготовиться к следующему дню. Установите режим сна, старайтесь ложиться и вставать в одно и то же время каждый день.',
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        ReadyHabits(
            name: 'Ограничение экранного времени',
            about: 'Снижает усталость глаз, улучшает сон и помогает сосредоточиться на реальном мире. Установите ограничения по времени использования устройств и замените экранное время на более полезные занятия.'
        )
      ],
    ),
  );
}