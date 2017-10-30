package com.nts.cozy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nts.cozy.vo.Favorite;
import com.nts.cozy.vo.FavoriteDetail;

/**
 * @author 박정재
 */
@Repository
public interface FavoriteDao {

	Favorite selectFavoriteState(Favorite favorite);
	
	List<FavoriteDetail> selectFavorites(String nickname);

	boolean insertFavorite(Favorite favorite);

	boolean toggleFavorite(int id);

	boolean deleteFavorite(int id);
	
}
