package com.nts.cozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nts.cozy.dao.FavoriteDao;
import com.nts.cozy.vo.Favorite;
import com.nts.cozy.vo.FavoriteDetail;

/**
 * @author 박정재
 *
 */
@Service
public class FavoriteService {
	
	@Autowired
	FavoriteDao favoriteDao;

	public List<FavoriteDetail> getFavorites(String nickname) {
		return favoriteDao.selectFavorites(nickname);
	}

	public Favorite getFavoriteState(Favorite favorite) {
		return favoriteDao.selectFavoriteState(favorite);
	}

	public boolean registerFavorite(Favorite favorite) {
		return favoriteDao.insertFavorite(favorite);
	}

	public boolean toggleFavorite(int id) {
		return favoriteDao.toggleFavorite(id);
	}

	public boolean removeFavorite(int id) {
		return favoriteDao.deleteFavorite(id);
	}

}
