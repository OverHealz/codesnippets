-- Function to cast Power Word: Shield on party members who do not have it active
function castPowerWordShield()
  for i=1,#party do
    local player = party[i]
    if not player.hasBuff("Power Word: Shield") then
      castSpell(player, "Power Word: Shield")
    end
  end
end

-- Function to cast Shadow Mend on party members below 50% health
function castShadowMend()
  for i=1,#party do
    local player = party[i]
    if player.health < player.maxHealth / 2 then
      castSpell(player, "Shadow Mend")
    end
  end
end

-- Main rotation function
function shadowPriestRotation()
  -- Cast Power Word: Shield on party members without it
  castPowerWordShield()
  
  -- Cast Shadow Mend on party members below 50% health
  castShadowMend()
  
  -- Cast Shadow Word: Pain on enemies within range
  for i=1,#enemies do
    local enemy = enemies[i]
    if enemy.distance < 30 then
      castSpell(enemy, "Shadow Word: Pain")
    end
  end
  
  -- Cast Shadow Word: Death on enemies below 20% health
  for i=1,#enemies do
    local enemy = enemies[i]
    if enemy.health < enemy.maxHealth / 5 then
      castSpell(enemy, "Shadow Word: Death")
    end
  end
  
  -- Cast Vampiric Touch on enemies within range
  for i=1,#enemies do
    local enemy = enemies[i]
    if enemy.distance < 30 then
      castSpell(enemy, "Vampiric Touch")
    end
  end
  
  -- Cast Mind Flay on enemies within range
  for i=1,#enemies do
    local enemy = enemies[i]
    if enemy.distance < 30 then
      castSpell(enemy, "Mind Flay")
    end
  end
  
  -- Cast Shadow Word: Void on enemies within range
  for i=1,#enemies do
    local enemy = enemies[i]
    if enemy.distance < 30 then
      castSpell(enemy, "Shadow Word: Void")
    end
  end
end

-- Loop the rotation function indefinitely
while true do
  shadowPriestRotation()
  wait(1)
end
