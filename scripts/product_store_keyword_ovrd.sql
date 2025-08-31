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
-- Name: product_store_keyword_ovrd; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_keyword_ovrd (
    product_store_id character varying(20) NOT NULL,
    keyword character varying(60) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    target character varying(255),
    target_type_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_keyword_ovrd OWNER TO ofbiz;

--
-- Name: product_store_keyword_ovrd pk_product_store_keyword_ovrd; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_keyword_ovrd
    ADD CONSTRAINT pk_product_store_keyword_ovrd PRIMARY KEY (product_store_id, keyword, from_date);


--
-- Name: prdstrkwo_enm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrkwo_enm ON product_store_keyword_ovrd USING btree (target_type_enum_id);


--
-- Name: prdstrkwo_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrkwo_prds ON product_store_keyword_ovrd USING btree (product_store_id);


--
-- Name: prt_str_kwd_ovd_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_kwd_ovd_tp ON product_store_keyword_ovrd USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_kwd_ovd_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_kwd_ovd_ts ON product_store_keyword_ovrd USING btree (created_tx_stamp);


--
-- Name: product_store_keyword_ovrd prdstrkwo_enm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_keyword_ovrd
    ADD CONSTRAINT prdstrkwo_enm FOREIGN KEY (target_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store_keyword_ovrd prdstrkwo_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_keyword_ovrd
    ADD CONSTRAINT prdstrkwo_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

