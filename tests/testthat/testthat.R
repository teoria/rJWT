context("JWT production")
library(rJWT)






test_that("JWT - teste 1", {
        ann <- JWT$new("Ann", "black")
        expect_equal(ann$hair, "black")
})

test_that("str_length of factor is length of level", {
        expect_equal(1, 1)
})

test_that("str_length of missing is missing", {
        expect_equal(2, 2)
})
