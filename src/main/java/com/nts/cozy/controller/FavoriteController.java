package com.nts.cozy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nts.cozy.service.FavoriteService;
import com.nts.cozy.vo.Favorite;
import com.nts.cozy.vo.FavoriteDetail;

/**
 * @author 박정재
 */
@Controller
@RequestMapping("/favorite")
public class FavoriteController {

	@Autowired
	FavoriteService favoriteService;

	@GetMapping("/my/{nickname}")
	public String loadMyFavoriteView(Model model, @PathVariable("nickname") String nickname) {
		List<FavoriteDetail> favorites = favoriteService.getFavorites(nickname);
		model.addAttribute("favorites", favorites);
		return "mypage/favorite";
	}

	@GetMapping("/state")
	@ResponseBody
	public Favorite getFavoriteState(Favorite favorite) {
		Favorite state = favoriteService.getFavoriteState(favorite);
		if (state == null) {
			return null;
		}
		return state;
	}

	@PostMapping("/register")
	@ResponseBody
	public Boolean registerFavorite(Favorite favorite) {
		return favoriteService.registerFavorite(favorite);
	}

	@PostMapping("/{favoriteId}")
	@ResponseBody
	public Boolean toggleFavorite(@PathVariable("favoriteId") int id) {
		return favoriteService.toggleFavorite(id);
	}

	@PostMapping("/remove/{favoriteId}")
	@ResponseBody
	public Boolean removeFavorite(@PathVariable("favoriteId") int id) {
		return favoriteService.removeFavorite(id);
	}

}
