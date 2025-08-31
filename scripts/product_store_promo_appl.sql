--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product_store_promo_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_promo_appl (
    product_store_id character varying(20) NOT NULL,
    product_promo_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    manual_only character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_promo_appl OWNER TO ofbiz;

--
-- Name: product_store_promo_appl pk_product_store_promo_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_promo_appl
    ADD CONSTRAINT pk_product_store_promo_appl PRIMARY KEY (product_store_id, product_promo_id, from_date);


--
-- Name: prdstrprmo_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrprmo_prds ON product_store_promo_appl USING btree (product_store_id);


--
-- Name: prdstrprmo_prmo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrprmo_prmo ON product_store_promo_appl USING btree (product_promo_id);


--
-- Name: prt_str_prm_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_prm_apl_tp ON product_store_promo_appl USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_prm_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_prm_apl_ts ON product_store_promo_appl USING btree (created_tx_stamp);


--
-- Name: product_store_promo_appl prdstrprmo_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_promo_appl
    ADD CONSTRAINT prdstrprmo_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_promo_appl prdstrprmo_prmo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_promo_appl
    ADD CONSTRAINT prdstrprmo_prmo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- PostgreSQL database dump complete
--

