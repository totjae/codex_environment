package com.jae.a.sudoku.ui

import android.os.Bundle
import android.view.Gravity
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.jae.a.sudoku.databinding.ActivitySudokuBinding

class SudokuActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySudokuBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySudokuBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Simple 9x9 grid with placeholder numbers
        repeat(9) { row ->
            repeat(9) { col ->
                val cell = TextView(this).apply {
                    text = ""
                    gravity = Gravity.CENTER
                    width = resources.displayMetrics.density.times(40).toInt()
                    height = width
                    setBackgroundResource(android.R.drawable.alert_light_frame)
                }
                binding.grid.addView(cell)
            }
        }
    }
}
