import { useState, useEffect } from 'react';
import axios from 'axios'

export default function table() {
  return (
    <div>
      <BattlegroundHeader/>
      <BattlegroundTable/>
    </div>
  )
}

const BattlegroundHeader = () => {
  return (
    <h1>배틀그라운드 무기 종류</h1>
   )
}

const BattlegroundTable = () => {
  const [units, setUnits] = useState([])

  const fetchBG = async () => {
    try {
      const res = await axios.get('https://db-project-laase.run.goorm.io/api/battleground')
      setUnits(res.data)
    } catch(err){
    console.log(err)
    }
  }

  useEffect(() => {
    fetchBG()
  }, [])

  return (
    <table>
      <tr>
        <th>이미지</th>
        <th>이름</th>
        <th>종류</th>
        <th>탄</th>
        <th>데미지</th>
        <th>탄속</th>
        <th>연사 속도</th>
      </tr>
      {units.map((unit, index) => 
        <tr key={index}>
          <td><img src={`https://db-project-laase.run.goorm.io/public/images/${unit.filename}`} className='boxart'/></td>
          <td>{unit.name}</td>
          <td>{unit.type}</td>
          <td>{unit.bullet}</td>
          <td>{unit.damage}</td>
          <td>{unit.bullet_speed}</td>
          <td>{unit.burst_speed}</td>   
        </tr>
      )}
    </table>
  )
}
