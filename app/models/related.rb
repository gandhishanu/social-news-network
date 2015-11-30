class Related < ActiveRecord::Base
  belongs_to :related_post1, foreign_key: :post_id1, class_name: :Post
  belongs_to :related_post2, foreign_key: :post_id2, class_name: :Post

  def self.update_relations
    ActiveRecord::Base.connection.execute('DELETE FROM relateds')
    sql = '
    			INSERT INTO relateds(post_id1, post_id2, frequency, created_at, updated_at)
          SELECT
            pst1_id,
            pst2_id,
            count(*) freq,
            "2010-01-01 00:00:00",
            "2010-01-01 00:00:00"
          FROM
          (
            SELECT
              pst1.id pst1_id,
              pst2.id pst2_id
            FROM
              posts pst1,
              posts pst2,
              votes pv1,
              votes pv2
            WHERE
              pst1.id = pv1.post_id
              AND
              pst2.id = pv2.post_id
              AND
              pv1.user_id = pv2.user_id
              AND
              pst1.id <> pst2.id
              AND
              pv1.updown_cd = 0
              AND
              pv2.updown_cd = 0
            GROUP BY
              pst1.id, pst2.id, pv1.user_id
          ) t
          GROUP BY
            pst1_id, pst2_id
          ORDER BY
            pst1_id ASC, freq DESC'

    ActiveRecord::Base.connection.execute(sql)
  end

end
