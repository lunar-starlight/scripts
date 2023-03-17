from datetime import datetime, timedelta

def help():
	print("""\
	com(com_number, base_price)
	com_profit(base_price, c3_price)
	com_raw_profit(base_price)
	cell_expires_in(hours, minutes)
	breaktime(block_hardness, speed_modifier, efficiency, haste)""")

var('c', 'p', 'pres')
com(c, p, pres) = floor(p*9*64*(36+9*pres)*0.25*c)
com_raw(c, p, pres) = floor(p*9*64*(36+9*pres)*(1 + 0.25*c))
com_shards = [250 + 250*i for i in range(4)]
def com_profit(p, c3=0, pres=0):
	com_igm = [c3 * com_shards[i] for i in range(4)]
	return [
		f"""C{i} at ${round(p, 1)} per: ${
		floor(com(i, p, pres)-com_igm[i]):>6}, ${
		floor((com(i, p, pres)-com_igm[i])/com_shards[i]):>3}/sh"""
		for i in range(0 if c3 == 0 else 1, 4)]
def com_raw_profit(p, pres=0):
        return [
                f"""C{i} at ${round(p, 2)} per: ${
                floor(com_raw(i, p, pres)):>6}"""
                for i in range(4)]

def cell_expires_in(h, m):
	t = datetime.now() + timedelta(hours=int(h), minutes=int(m))
	return f"{t.hour:02}:{t.minute:02}"

def breaktime(hardness, speed_mod, effi, haste):
	return 30*hardness / (speed_mod + 1 + effi^2) / (1 + 0.2*haste)

