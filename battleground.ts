import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../connection'

export default async (req: NextApiRequest, res: NextApiResponse) => {

  const query = `
  select * from weapon
  left join image on (weapon.id = weapon_id)
  `
  
  try {
     const [ rows, fields ] = await db.execute(query)
     // console.log(rows)
     res.status(200).json(rows)
  } catch (err) {
    return res.status(500).json(err)
  }
}
