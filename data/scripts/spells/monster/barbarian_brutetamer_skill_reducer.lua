local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)

local parameters = {
	{key = CONDITION_PARAM_TICKS, value = 5 * 1000},
	{key = CONDITION_PARAM_SKILL_UNARMED, value = nil},
	{key = CONDITION_PARAM_SKILL_ONEHAND, value = nil},
	{key = CONDITION_PARAM_SKILL_TWOHAND, value = nil},
	{key = CONDITION_PARAM_SKILL_DISTANCE, value = nil},
	{key = CONDITION_PARAM_SKILL_SHIELD, value = nil}
}

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	local index = math.random(2, #parameters)
	parameters[index].value = -math.random(1, 6)

	for _, target in ipairs(combat:getTargets(creature, variant)) do
		target:addAttributeCondition({parameters[1], parameters[index]})
	end
	return true
end

spell:name("barbarian brutetamer skill reducer")
spell:words("###38")
spell:blockWalls(true)
spell:needTarget(true)
spell:needLearn(true)
spell:register()
